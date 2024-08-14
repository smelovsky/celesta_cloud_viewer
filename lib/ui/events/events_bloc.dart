import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cancellation_token/cancellation_token.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../../freezed/cloud_dio_network_manager.dart';
import '../../freezed/requests/isolated_network_request.dart';
import '../../freezed/responses/cloud_response.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  AuthToken authToken = AuthToken(session_id: "", session_type: "");
  List<VideoEvent> eventList = [];
  List<GeoPoint> trackList = [];
  String mediaUrl = "";
  String errorMessage = "";

  final CloudDioNetworkManager _networkManager = CloudDioNetworkManager();

  late IsolatedNetworkRequestLogin isolatedNetworkRequestLogin;
  late IsolatedNetworkRequestGetEvents isolatedNetworkRequestGetEvents;
  late IsolatedNetworkRequestGetNaviTrack isolatedNetworkRequestGetNaviTrack;
  late IsolatedNetworkRequestGetThumbnail isolatedNetworkRequestGetThumbnail;
  late IsolatedNetworkRequestGetMediaUrl isolatedNetworkRequestGetMediaUrl;

  late CancellationToken cancellationToken;

  EventsBloc() : super(EventsState.initial()) {
    on<ConnectEventsEvent>((event, emit) async {
      emit(state.copyWithState(
        viewState: EventsViewState.inprogress,
      ));

      //print("STEP 1");
      if (!await _login(event.host, event.login, event.password)) {
        if (state.viewState != EventsViewState.aborted) {
          emit(state.copyWithState(viewState: EventsViewState.failed));
        }
        return;
      }

      //print("STEP 2");
      if (!await _getEvents(event.host, event.cameraName)) {
        if (state.viewState != EventsViewState.aborted) {
          emit(state.copyWithState(viewState: EventsViewState.failed));
        }
        return;
      }

      var latitude = 0.0;
      var longitude = 0.0;
      if (trackList.length > 0) {
        latitude = trackList[0].latitude;
        longitude = trackList[0].longitude;
      }

      //print("STEP 3");

      if (!await _getNaviTrack(event.host, event.cameraName)) {
        if (state.viewState != EventsViewState.aborted) {
          emit(state.copyWithState(viewState: EventsViewState.failed));
        }
        return;
      }

      //print("STEP 4");

      if (!await _getMediaUrl(
          event.host, authToken.session_id, event.cameraName)) {
        if (state.viewState != EventsViewState.aborted) {
          emit(state.copyWithState(viewState: EventsViewState.failed));
        }
        return;
      }

      //print("STEP 5 ${mediaUrl}");

      emit(state.copyWithStateAndContent(
          viewState: EventsViewState.success,
          eventList: eventList,
          trackList: trackList,
          latitude: latitude,
          longitude: longitude,
          authToken: authToken,
          mediaUrl: mediaUrl,
          errorMessage: errorMessage));
    });

    on<AbortEventsEvent>((event, emit) {
      cancellationToken.cancel();

      emit(state.copyWithState(viewState: EventsViewState.aborted));
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }

  void onHandleError() {}

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
    cancellationToken = CancellationToken();
    final response = await _networkManager.performRequestLogin(
        isolatedNetworkRequestLogin, cancellationToken);

    if (response == null) {
      errorMessage = "Unknown error";
      return false;
    }

    authToken = response;
    return true;
  }

  Future<bool> _getEvents(String url, String cameraName) async {
    final Map<String, dynamic> _headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    Dio dio = Dio() // Provide a dio instance
      ..options.connectTimeout = Duration(seconds: 15)
      ..options.receiveTimeout = Duration(seconds: 15)
      ..options.baseUrl = url
      ..options.headers = _headers
      ..interceptors.add(LogInterceptor(responseBody: true));

    isolatedNetworkRequestGetEvents =
        IsolatedNetworkRequestGetEvents(dio, authToken.session_id, cameraName);
    cancellationToken = CancellationToken();
    final response = await _networkManager.performRequestGetEvents(
        isolatedNetworkRequestGetEvents, cancellationToken);

    if (response == null) {
      errorMessage = "Unknown error";
      return false;
    }

    if (response.runtimeType != List<VideoEvent>) {
      errorMessage = "Unknown error";
      return false;
    }

    eventList = response;

    return true;
  }

  Future<bool> _getNaviTrack(String url, String cameraName) async {
    final Map<String, dynamic> _headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    Dio dio = Dio() // Provide a dio instance
      ..options.connectTimeout = Duration(seconds: 15)
      ..options.receiveTimeout = Duration(seconds: 15)
      ..options.baseUrl = url
      ..options.headers = _headers
      ..interceptors.add(LogInterceptor(responseBody: true));

    isolatedNetworkRequestGetNaviTrack = IsolatedNetworkRequestGetNaviTrack(
        dio, authToken.session_id, cameraName);
    cancellationToken = CancellationToken();
    final response = await _networkManager.performRequestGetNaviTrack(
        isolatedNetworkRequestGetNaviTrack, cancellationToken);
    if (response == null) {
      return false;
    }

    trackList = response;

    return true;
  }

  Future<bool> _getMediaUrl(
      String cloudUrl, String session_id, String device_name) async {
    final Map<String, dynamic> _headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    Dio dio = Dio() // Provide a dio instance
      ..options.connectTimeout = Duration(seconds: 15)
      ..options.receiveTimeout = Duration(seconds: 15)
      ..options.baseUrl = cloudUrl + "devices/" + device_name
      ..options.headers = _headers
      ..interceptors.add(LogInterceptor(responseBody: true));

    isolatedNetworkRequestGetMediaUrl =
        IsolatedNetworkRequestGetMediaUrl(dio, session_id);
    cancellationToken = CancellationToken();
    final response = await _networkManager.performRequestGetMediaUrl(
        isolatedNetworkRequestGetMediaUrl, cancellationToken);

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
