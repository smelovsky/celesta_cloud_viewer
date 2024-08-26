import 'package:flutter/cupertino.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'freezed/responses/cloud_response.dart';

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
    required this.videoUrl,
    required this.isFront,
    required this.selectedDay,
    required this.eventsPageTbIndex,
    required this.eventList,
    required this.trackList,
    required this.selectedEventIndex,
    required this.selectorIndex,
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
  String videoUrl = "";
  bool isFront = true;
  DateTime selectedDay = DateTime.now();
  int eventsPageTbIndex = 0;
  List<VideoEvent> eventList = [];
  List<GeoPoint> trackList = [];
  int selectedEventIndex = -1;
  int selectorIndex = 0;
}
