import 'dart:developer';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_response.freezed.dart';
part 'cloud_response.g.dart';

@freezed
class AuthToken with _$AuthToken {
  const factory AuthToken({
    required String session_id,
    required String session_type,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, Object?> json) =>
      _$AuthTokenFromJson(json);
}

@freezed
class CameraDevice with _$CameraDevice {
  const factory CameraDevice({
    required String device_uid,
    required String device_id,
    required String device_name,
    required String device_display_name,
    required String recent_thumb_url,
    required List<double> recent_geo_position,
  }) = _CameraDevice;

  factory CameraDevice.fromJson(Map<String, Object?> json) =>
      _$CameraDeviceFromJson(json);
}

class CameraDeviceList {
  List<CameraDevice> list = [];

  CameraDeviceList({required this.list});

  CameraDeviceList.fromJson(dynamic json) {
    var devices = json["devices"];

    for (var device in devices) {
      final device_uid = device["device_uid"];
      final device_id = device["device_id"];
      final device_name = device["device_name"];
      final device_display_name = device["device_display_name"];
      final recent_thumb_url = device["recent_thumb_url"];
      final recent_geo_position = device["recent_geo_position"];

      List<double> geo = [0, 0];
      if (recent_geo_position != null) {
        geo[0] = recent_geo_position[0];
        geo[1] = recent_geo_position[1];
      }

      if (device_uid != null &&
              device_id != null &&
              device_name != null &&
              device_display_name != null //&&
          //recent_thumb_url != null
          ) {
        final cameraDevice = CameraDevice(
          device_uid: device_uid,
          device_id: device_id,
          device_name: device_name,
          device_display_name: device_display_name,
          recent_thumb_url: (recent_thumb_url == null) ? "" : recent_thumb_url,
          recent_geo_position: (recent_geo_position == null) ? [] : geo,
        );

        list.add(cameraDevice);
      }
    }
  }
}

@freezed
class MewdiaUrl with _$MewdiaUrl {
  const factory MewdiaUrl({
    required String private,
  }) = _MewdiaUrl;

  factory MewdiaUrl.fromJson(Map<String, Object?> json) =>
      _$MewdiaUrlFromJson(json);
}

////////////////////////////////////////////////////////////////////////////////
//

@freezed
class NaviPoint with _$NaviPoint {
  const factory NaviPoint({
    required double lat,
    required double lon,
    required double s,
  }) = _NaviPoint;

  factory NaviPoint.fromJson(Map<String, Object?> json) =>
      _$NaviPointFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    required NaviPoint navi,
    required String trigger,
    required String trigger_subtype,
  }) = _Meta;

  factory Meta.fromJson(Map<String, Object?> json) => _$MetaFromJson(json);
}

@freezed
class VideoEvent with _$VideoEvent {
  const factory VideoEvent({
    required String id,
    required int timestamp,
    required CameraDevice device,
    required List<String> thumbnails,
    required Meta meta,
  }) = _VideoEvent;

  factory VideoEvent.fromJson(Map<String, Object?> json) =>
      _$VideoEventFromJson(json);
}

class CameraEventList {
  List<VideoEvent> list = [];

  CameraEventList({required this.list});

  CameraEventList.fromJson(dynamic json) {
    var events = json["videoevents"];

    for (var event in events) {
      final id = event["id"];
      final name = event["name"];
      final device = event["device"];
      final thumbnails = event["thumbnails"];
      final videos = event["videos"];
      final meta = event["meta"];
      final timestamp = event["timestamp"];
      final trigger = meta["trigger"];
      final trigger_subtype = meta["trigger_subtype"];
      final navi = meta["navi"];
      final lon = navi["lon"];
      final lat = navi["lat"];
      final s = navi["s"];

      final thumbnails_list = thumbnails.cast<String>();

      final device_uid = device["device_uid"];
      final device_id = device["device_id"];
      final device_name = device["device_name"];
      final device_display_name = device["device_display_name"];
      final recent_geo_position = device["recent_geo_position"];

      List<double> geo = [0, 0];
      if (recent_geo_position != null) {
        geo[0] = recent_geo_position[0];
        geo[1] = recent_geo_position[1];
      }

      if (device_uid != null &&
          device_id != null &&
          device_name != null &&
          device_display_name != null) {
        final cameraDevice = CameraDevice(
          device_uid: device_uid,
          device_id: device_id,
          device_name: device_name,
          device_display_name: device_display_name,
          recent_thumb_url: "",
          recent_geo_position: geo,
        );

        final cameraEvent = VideoEvent(
          id: id,
          timestamp: timestamp,
          device: cameraDevice,
          thumbnails: thumbnails_list,
          meta: Meta(
              navi: NaviPoint(lat: lat, lon: lon, s: s),
              trigger: (trigger == null) ? "unknown" : trigger,
              trigger_subtype:
                  (trigger_subtype == null) ? "unknown" : trigger_subtype),
        );

        list.add(cameraEvent);
      }
    }
  }
}

class CameraTrackList {
  List<GeoPoint> list = [];

  CameraTrackList({required this.list});

  CameraTrackList.fromJson(dynamic json) {
    List<dynamic> layers = json["layers"];

    for (var layer in layers) {
      List<dynamic> objects = layer["objects"];

      for (var object in objects) {
        List<dynamic> coordinates = object["coordinates"];

        for (var coordinate in coordinates) {
          list.add(GeoPoint(latitude: coordinate[0], longitude: coordinate[1]));
        }
      }
    }
  }
}
