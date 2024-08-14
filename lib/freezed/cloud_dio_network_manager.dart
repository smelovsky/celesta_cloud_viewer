import 'dart:convert';
import 'dart:developer';

import 'package:cancellation_token/cancellation_token.dart';
import 'package:celesta_cloud_viewer/freezed/requests/isolated_network_request.dart';
import 'package:celesta_cloud_viewer/freezed/responses/cloud_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiver/time.dart';

class CloudDioNetworkManager {
  Future performRequestLogin(
    IsolatedNetworkRequestLogin isolatedRequest,
    CancellationToken cancellationToken,
  ) async {
    try {
      final response = await CancellableIsolate.run(
        () {
          return compute(executeRequestLogin, isolatedRequest);
        },
        cancellationToken,
      );

      return response;
    } on CancelledException {
      return [];
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future performRequestGetDevices(
    IsolatedNetworkRequestGetDevices isolatedRequest,
    CancellationToken cancellationToken,
  ) async {
    try {
      final response = await CancellableIsolate.run(
        () {
          return compute(executeRequestGetDevices, isolatedRequest);
        },
        cancellationToken,
      );

      return response;
    } on CancelledException {
      return [];
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future performRequestGetEvents(
    IsolatedNetworkRequestGetEvents isolatedRequest,
    CancellationToken cancellationToken,
  ) async {
    try {
      final response = await CancellableIsolate.run(
        () {
          return compute(executeRequestGetEvents, isolatedRequest);
        },
        cancellationToken,
      );

      return response;
    } on CancelledException {
      return [];
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future performRequestGetNaviTrack(
    IsolatedNetworkRequestGetNaviTrack isolatedRequest,
    CancellationToken cancellationToken,
  ) async {
    try {
      final response = await CancellableIsolate.run(
        () {
          return compute(executeRequestGetNaviTrack, isolatedRequest);
        },
        cancellationToken,
      );

      return response;
    } on CancelledException {
      return [];
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future performRequestGetMediaUrl(
    IsolatedNetworkRequestGetMediaUrl isolatedRequest,
    CancellationToken cancellationToken,
  ) async {
    try {
      final response = await CancellableIsolate.run(
        () {
          return compute(executeRequestGetMediaUrl, isolatedRequest);
        },
        cancellationToken,
      );

      return response;
    } on CancelledException {
      return "";
    } on DioException catch (e) {
      return e.response?.data;
    }
  }
}

Future executeRequestLogin(
  IsolatedNetworkRequestLogin isolatedRequest,
) async {
  try {
    final params = {
      "user_email": isolatedRequest.login,
      "user_password": isolatedRequest.password,
    };

    final auth_params = {
      "auth_data": params,
    };

    final auth_data = jsonEncode(auth_params);

    final response = await isolatedRequest.dio.post(
      '/auth',
      data: auth_data,
      options: Options(headers: {"X-Tenant-Id": "celesta"}),
    );

    return AuthToken.fromJson(response.data);
  } catch (error) {
    return Future.error(error);
  }
}

Future executeRequestGetDevices(
  IsolatedNetworkRequestGetDevices isolatedRequest,
) async {
  try {
    final response = await isolatedRequest.dio.get(
      '/account/devices',
      options: Options(headers: {"Session-Id": isolatedRequest.session_id}),
    );

    return CameraDeviceList.fromJson(response.data).list;
  } catch (error) {
    return Future.error(error);
  }
}

Future executeRequestGetEvents(
  IsolatedNetworkRequestGetEvents isolatedRequest,
) async {
  try {
    final date = DateTime.now();

    int lastDay = daysInMonth(date.year, date.month);

    var fromDateTime = DateTime(date.year, date.month, 1, 0, 0, 0, 0);
    var toDateTime = DateTime(date.year, date.month, lastDay, 23, 59, 59, 999);
    int fromTimestamp = fromDateTime.millisecondsSinceEpoch;
    int toTimestamp = toDateTime.millisecondsSinceEpoch;

    //print("DateTime: ${fromDateTime} - ${toDateTime}");

    final params = {
      //'date_from': fromTimestamp,
      //'date_to': toTimestamp,
      'sort': 'desc',
    };

    final response = await isolatedRequest.dio.get(
      "/devices/${isolatedRequest.cameraName}/videoevents",
      queryParameters: params,
      options: Options(headers: {"Session-Id": isolatedRequest.session_id}),
    );

    return CameraEventList.fromJson(response.data).list;
  } catch (error) {
    return Future.error(error);
  }
}

Future executeRequestGetNaviTrack(
  IsolatedNetworkRequestGetNaviTrack isolatedRequest,
) async {
  try {
    var startDateTime = DateTime(2004, 8, 1, 1, 0);
    //var startDateTime = DateTime.now();
    var endDateTime = DateTime(2025, 1, 1, 1, 0);
    int startTimestamp = startDateTime.millisecondsSinceEpoch;
    int endTimestamp = endDateTime.millisecondsSinceEpoch;

    final params = {
      'start_time': startTimestamp,
      'end_time': endTimestamp,
      'crop_track': 1,
      'north_east_lng': 179.9999999,
      'north_east_lat': 90.0,
      'south_west_lng': -180.0,
      'south_west_lat': -90.0,
      'zoom': 0,
      'locations_limit': 2,
    };

    final response = await isolatedRequest.dio.get(
      "/devices/${isolatedRequest.cameraName}/geo/layers",
      //"/devices/${isolatedRequest.cameraName}/geo/tracks",
      queryParameters: params,
      options: Options(headers: {"Session-Id": isolatedRequest.session_id}),
    );

    var x = CameraTrackList.fromJson(response.data);
    return x.list;
  } catch (error) {
    //print("error: ${error}");
    return Future.error(error);
  }
}

Future executeRequestGetMediaUrl(
  IsolatedNetworkRequestGetMediaUrl isolatedRequest,
) async {
  try {
    final params = {
      "protocol": "RTMP",
      "use_adaptive_bitrate": false,
      "stream_id": "0",
    };

    final media_data = jsonEncode(params);

    final response = await isolatedRequest.dio.post(
      '/live',
      data: media_data,
      options: Options(headers: {"Session-Id": isolatedRequest.session_id}),
    );

    print("executeRequestGetMediaUrl: ${response.data}");

    final media_url = response.data["media_url"];
    final media_url_element = media_url[0];
    final rtmp = media_url_element["rtmp"];
    final private = rtmp["private"];

    return private;

    //return MewdiaUrl.fromJson(response.data);
  } on DioException catch (error) {
    var errorMessage = error.response?.data["message"];
    //print("errorMessage: ${errorMessage}");

    return Future.error(error);
  }
}
