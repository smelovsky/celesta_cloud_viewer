import 'package:dio/dio.dart';

class IsolatedNetworkRequest {
  final Dio dio;

  IsolatedNetworkRequest(
    this.dio,
  );
}

class IsolatedNetworkRequestLogin {
  final Dio dio;
  final String login;
  final String password;

  IsolatedNetworkRequestLogin(
    this.dio,
    this.login,
    this.password,
  );
}

class IsolatedNetworkRequestGetDevices {
  final Dio dio;
  final String session_id;

  IsolatedNetworkRequestGetDevices(
    this.dio,
    this.session_id,
  );
}

class IsolatedNetworkRequestGetEvents {
  final Dio dio;
  final String session_id;
  final String cameraName;

  IsolatedNetworkRequestGetEvents(
    this.dio,
    this.session_id,
    this.cameraName,
  );
}

class IsolatedNetworkRequestGetNaviTrack {
  final Dio dio;
  final String session_id;
  final String cameraName;

  IsolatedNetworkRequestGetNaviTrack(
    this.dio,
    this.session_id,
    this.cameraName,
  );
}

class IsolatedNetworkRequestGetMediaUrl {
  final Dio dio;
  final String session_id;

  IsolatedNetworkRequestGetMediaUrl(
    this.dio,
    this.session_id,
  );
}

class IsolatedNetworkRequestGetThumbnail {
  final Dio dio;
  final String session_id;

  IsolatedNetworkRequestGetThumbnail(
    this.dio,
    this.session_id,
  );
}
