import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cancellation_token/cancellation_token.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../../freezed/cloud_dio_network_manager.dart';
import '../../freezed/requests/isolated_network_request.dart';
import '../../freezed/responses/cloud_response.dart';

part 'cameras_event.dart';
part 'cameras_state.dart';

class CamerasBloc extends Bloc<CamerasEvent, CamerasState> {
  AuthToken authToken = AuthToken(session_id: "", session_type: "");
  List<CameraDevice> deviceList = [];

  final CloudDioNetworkManager _networkManager = CloudDioNetworkManager();

  late IsolatedNetworkRequestLogin isolatedNetworkRequestLogin;
  late CancellationToken cancellationTokenLogin;

  late IsolatedNetworkRequestGetDevices isolatedNetworkRequestGetDevices;
  late CancellationToken cancellationTokenGetDevices;

  CamerasBloc() : super(CamerasState.initial()) {
    on<ConnectCamerasEvent>((event, emit) async {
      emit(state.copyWithState(
        viewState: CamerasViewState.inprogress,
      ));

      //print("STEP 1");
      if (!await _login(event.host, event.login, event.password)) {
        if (state.viewState != CamerasViewState.aborted) {
          emit(state.copyWithState(viewState: CamerasViewState.failed));
        }
        return;
      }

      //print("STEP 2");

      if (!await _getDevices(event.host)) {
        if (state.viewState != CamerasViewState.aborted) {
          emit(state.copyWithState(viewState: CamerasViewState.failed));
        }
        return;
      }

          emit(state.copyWithStateAndDeviceListAndAuthToken(
            viewState: CamerasViewState.success,
            deviceList: deviceList,
            authToken: authToken,
          ));
    });

    on<AbortCamerasEvent>((event, emit) {
      cancellationTokenLogin.cancel();

      emit(state.copyWithState(viewState: CamerasViewState.aborted));
    });

    on<PreviewCamerasEvent>((event, emit) {
      emit(state.copyWithState(viewState: CamerasViewState.preview));
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }

  void onHandleError() {
    //print("onHandleError");
  }

  Future<bool> _login(String url, String login, String password) async {
    final Map<String, dynamic> _headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    Dio dio = Dio() // Provide a dio instance
      ..options.connectTimeout = Duration(seconds: 15)
      ..options.receiveTimeout = Duration(seconds: 15)
      ..options.baseUrl = url
      ..options.headers = _headers
      ..interceptors.add(LogInterceptor(responseBody: true));

    isolatedNetworkRequestLogin =
        IsolatedNetworkRequestLogin(dio, login, password);
    cancellationTokenLogin = CancellationToken();
    final response = await _networkManager.performRequestLogin(
        isolatedNetworkRequestLogin, cancellationTokenLogin);
    if (response == null) {
      return false;
    }

    authToken = response;

    return true;
  }

  Future<bool> _getDevices(String url) async {
    final Map<String, dynamic> _headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    Dio dio = Dio() // Provide a dio instance
      ..options.connectTimeout = Duration(seconds: 15)
      ..options.receiveTimeout = Duration(seconds: 15)
      ..options.baseUrl = url
      ..options.headers = _headers
      ..interceptors.add(LogInterceptor(responseBody: true));

    isolatedNetworkRequestGetDevices =
        IsolatedNetworkRequestGetDevices(dio, authToken.session_id);
    cancellationTokenGetDevices = CancellationToken();
    final response = await _networkManager.performRequestGetDevices(
        isolatedNetworkRequestGetDevices, cancellationTokenGetDevices);
    if (response == null) {
      return false;
    }

    deviceList = response;

    return true;
  }
}
