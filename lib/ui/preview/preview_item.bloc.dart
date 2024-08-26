import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cancellation_token/cancellation_token.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import '../../freezed/cloud_dio_network_manager.dart';
import '../../freezed/requests/isolated_network_request.dart';

part 'preview_item_event.dart';
part 'preview_item_state.dart';

class PreviewItemBloc extends Bloc<PreviewItemEvent, PreviewItemState> {
  String mediaUrl = "";
  String errorMessage = "";

  final CloudDioNetworkManager _networkManager = CloudDioNetworkManager();

  late IsolatedNetworkRequestGetMediaUrl isolatedNetworkRequestGetMediaUrl;
  late CancellationToken cancellationTokenGetMediaUrl;

  PreviewItemBloc() : super(PreviewItemState.initial()) {
    on<ConnectPreviewItemEvent>((event, emit) async {
      emit(state.copyWithState(
        screenState: PreviewItemScreenState.inprogress,
      ));

      if (!await _getMediaUrl(event.host, event.session_id, event.device_id)) {
        if (state.screenState != PreviewItemScreenState.aborted) {
          emit(state.copyWithStateAndError(
              screenState: PreviewItemScreenState.failed,
              errorMessage: errorMessage));
        }
      }
      emit(state.copyWithStateAndMediaUrl(
          screenState: PreviewItemScreenState.success,
          mediaUrl: mediaUrl,
          errorMessage: errorMessage));

      return;
    });

    on<AbortPreviewItemEvent>((event, emit) async {
      emit(state.copyWithState(
        screenState: PreviewItemScreenState.aborted,
      ));
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }

  Future<bool> _getMediaUrl(
      String cloudUrl, String session_id, String device_id) async {
    final Map<String, dynamic> _headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    Dio dio = Dio() // Provide a dio instance
      ..options.connectTimeout = Duration(seconds: 15)
      ..options.receiveTimeout = Duration(seconds: 15)
      ..options.baseUrl = cloudUrl + "devices/" + device_id
      ..options.headers = _headers
      ..interceptors.add(LogInterceptor(responseBody: true));

    isolatedNetworkRequestGetMediaUrl =
        IsolatedNetworkRequestGetMediaUrl(dio, session_id);
    cancellationTokenGetMediaUrl = CancellationToken();
    final response = await _networkManager.performRequestGetMediaUrl(
        isolatedNetworkRequestGetMediaUrl, cancellationTokenGetMediaUrl);

    print("response: ${response.runtimeType}");

    if (response.runtimeType == String) {
      //mediaUrl = 'https://media.w3.org/2010/05/sintel/trailer.mp4';
      mediaUrl = response;

      return true;
    } else {
      if (response != null) {
        final message = response["message"];
        if (message != null) {
          errorMessage = message;
          mediaUrl = "";
        } else {
          errorMessage = "Unknown error";
          mediaUrl = "";
        }
      } else {
        errorMessage = "Unknown error";
        mediaUrl = "";
      }

      return true;
    }
  }
}
