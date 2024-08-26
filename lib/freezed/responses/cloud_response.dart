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
    required String? device_name,
    required String? device_display_name,
    required String? recent_thumb_url,
    required List<double>? recent_geo_position,
  }) = _CameraDevice;

  factory CameraDevice.fromJson(Map<String, Object?> json) =>
      _$CameraDeviceFromJson(json);
}

@freezed
class CameraDeviceContainer with _$CameraDeviceContainer {
  const factory CameraDeviceContainer({
    required List<CameraDevice>? devices,
  }) = _CameraDeviceContainer;

  factory CameraDeviceContainer.fromJson(Map<String, Object?> json) =>
      _$CameraDeviceContainerFromJson(json);
}

class CameraDeviceList {
  List<CameraDevice> list = [];

  CameraDeviceList({required this.list});

  CameraDeviceList.fromJson(dynamic json) {
    final cameraDeviceContainer = CameraDeviceContainer.fromJson(json);
    if (cameraDeviceContainer != null) {
      final devices = cameraDeviceContainer.devices;
      if (devices != null) {
        for (var device in devices) {
          List<double> geo = [0, 0];
          if (device.recent_geo_position != null) {
            if (device.recent_geo_position!.length > 1) {
              geo[0] = device.recent_geo_position![0];
              geo[1] = device.recent_geo_position![1];
            }
          }

          if (device.device_name != null &&
              device.device_display_name != null) {
            final cameraDevice = CameraDevice(
              device_name: device.device_name,
              device_display_name: device.device_display_name,
              recent_thumb_url: (device.recent_thumb_url == null)
                  ? ""
                  : device.recent_thumb_url,
              recent_geo_position:
                  (device.recent_geo_position == null) ? [] : geo,
            );

            list.add(cameraDevice);
          }
        }
      }
    }
  }
}

@freezed
class MediaUrl with _$MediaUrl {
  const factory MediaUrl({
    required String? private,
  }) = _MediaUrl;

  factory MediaUrl.fromJson(Map<String, Object?> json) =>
      _$MediaUrlFromJson(json);
}

@freezed
class MediaUrlContainer with _$MediaUrlContainer {
  const factory MediaUrlContainer({
    required List<RtmpContainer>? media_url,
  }) = _MediaUrlContainer;

  factory MediaUrlContainer.fromJson(Map<String, Object?> json) =>
      _$MediaUrlContainerFromJson(json);
}

@freezed
class RtmpContainer with _$RtmpContainer {
  const factory RtmpContainer({
    required Rtmp? rtmp,
  }) = _RtmpContainer;

  factory RtmpContainer.fromJson(Map<String, Object?> json) =>
      _$RtmpContainerFromJson(json);
}

@freezed
class Rtmp with _$Rtmp {
  const factory Rtmp({
    required String? private,
  }) = _Rtmp;

  factory Rtmp.fromJson(Map<String, Object?> json) => _$RtmpFromJson(json);
}
////////////////////////////////////////////////////////////////////////////////
//

@freezed
class NaviPoint with _$NaviPoint {
  const factory NaviPoint({
    required double? lat,
    required double? lon,
    required double? s,
  }) = _NaviPoint;

  factory NaviPoint.fromJson(Map<String, Object?> json) =>
      _$NaviPointFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    required NaviPoint? navi,
    required String? trigger,
    required String? trigger_subtype,
  }) = _Meta;

  factory Meta.fromJson(Map<String, Object?> json) => _$MetaFromJson(json);
}

@freezed
class Videos with _$Videos {
  const factory Videos({
    required String? upload_id,
    required String? name,
  }) = _Videos;

  factory Videos.fromJson(Map<String, Object?> json) => _$VideosFromJson(json);
}

@freezed
class VideoEvent with _$VideoEvent {
  const factory VideoEvent({
    required String? id,
    required String? name,
    required int? timestamp,
    required CameraDevice? device,
    required List<String>? thumbnails,
    required Meta? meta,
    required List<Videos>? videos,
  }) = _VideoEvent;

  factory VideoEvent.fromJson(Map<String, Object?> json) =>
      _$VideoEventFromJson(json);
}

@freezed
class VideoEventContainer with _$VideoEventContainer {
  const factory VideoEventContainer({
    required List<VideoEvent>? videoevents,
  }) = _VideoEventContainer;

  factory VideoEventContainer.fromJson(Map<String, Object?> json) =>
      _$VideoEventContainerFromJson(json);
}

class CameraEventList {
  List<VideoEvent> list = [];

  CameraEventList({required this.list});

  CameraEventList.fromJson(dynamic json) {
    final videoEventContainer = VideoEventContainer.fromJson(json);
    if (videoEventContainer != null) {
      final videoevents = videoEventContainer.videoevents;

      if (videoevents != null) {
        for (var event in videoevents) {
          List<double> geo = [0, 0];
          if (event.device!.recent_geo_position != null) {
            if (event.device!.recent_geo_position!.length > 1) {
              geo[0] = event.device!.recent_geo_position![0];
              geo[1] = event.device!.recent_geo_position![1];
            }
          }

          if (event.device!.device_name != null &&
              event.device!.device_display_name != null) {
            final cameraDevice = CameraDevice(
              device_name: event.device!.device_name,
              device_display_name: event.device!.device_display_name,
              recent_thumb_url: "",
              recent_geo_position: geo,
            );

            final cameraEvent = VideoEvent(
              id: event.id,
              name: event.name,
              timestamp: event.timestamp,
              device: cameraDevice,
              thumbnails: event.thumbnails,
              videos: event.videos,
              meta: Meta(
                  navi: NaviPoint(
                      lat: event.meta?.navi?.lat,
                      lon: event.meta?.navi?.lon,
                      s: event.meta?.navi?.s),
                  trigger: (event.meta?.trigger == null)
                      ? "unknown"
                      : event.meta?.trigger,
                  trigger_subtype: (event.meta?.trigger_subtype == null)
                      ? "unknown"
                      : event.meta?.trigger_subtype),
            );

            list.add(cameraEvent);
          }
        }
      }
    }
  }
}

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    required List<List<double>>? coordinates,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, Object?> json) =>
      _$CoordinatesFromJson(json);
}

@freezed
class Layer with _$Layer {
  const factory Layer({
    required List<Coordinates>? objects,
  }) = _Layer;

  factory Layer.fromJson(Map<String, Object?> json) => _$LayerFromJson(json);
}

@freezed
class Track with _$Track {
  const factory Track({
    required List<Layer>? layers,
  }) = _Track;

  factory Track.fromJson(Map<String, Object?> json) => _$TrackFromJson(json);
}

class CameraTrackList {
  List<GeoPoint> list = [];

  CameraTrackList({required this.list});

  CameraTrackList.fromJson(dynamic json) {
    Track track = Track.fromJson(json);
    if (track != null) {
      final layers = track.layers;
      if (layers != null) {
        for (var layer in layers) {
          if (layer != null) {
            if (layer.objects != null) {
              for (int indObject = 0;
                  indObject < layer.objects!.length;
                  indObject++) {
                final object = layer.objects?[indObject];
                if (object != null) {
                  final coordinates = object?.coordinates;
                  if (coordinates != null) {
                    for (int indCoordinate = 0;
                        indCoordinate < coordinates!.length;
                        indCoordinate++) {
                      final point = coordinates![indCoordinate];
                      if (point != null) {
                        if (point.length == 2) {
                          list.add(GeoPoint(
                              latitude: point[0], longitude: point[1]));
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
