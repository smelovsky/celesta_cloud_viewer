import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  AppState({
    required this.keepScreenOn,
    required this.camerasFilter,
    required this.cloudUrl,
    required this.cloudLogin,
    required this.cloudPassword,
    required this.cameraName,
    required this.session_id,
    required this.isCamerasInited,
    required this.isEventsInited,
    required this.adasEventsFilter,
    required this.imuEventsFilter,
    required this.gpsEventsFilter,
    required this.dmsEventsFilter,
    required this.stopsEventsFilter,
    required this.otherEventsFilter,
  });

  bool keepScreenOn = true;
  String camerasFilter = "";
  String cloudUrl = "";
  String cloudLogin = "";
  String cloudPassword = "";
  String cameraName = "";
  String session_id = "";
  bool isCamerasInited = false;
  bool isEventsInited = false;
  bool adasEventsFilter = false;
  bool imuEventsFilter = false;
  bool gpsEventsFilter = false;
  bool dmsEventsFilter = false;
  bool stopsEventsFilter = false;
  bool otherEventsFilter = true;
}
