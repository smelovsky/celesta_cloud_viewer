// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthTokenImpl _$$AuthTokenImplFromJson(Map<String, dynamic> json) =>
    _$AuthTokenImpl(
      session_id: json['session_id'] as String,
      session_type: json['session_type'] as String,
    );

Map<String, dynamic> _$$AuthTokenImplToJson(_$AuthTokenImpl instance) =>
    <String, dynamic>{
      'session_id': instance.session_id,
      'session_type': instance.session_type,
    };

_$CameraDeviceImpl _$$CameraDeviceImplFromJson(Map<String, dynamic> json) =>
    _$CameraDeviceImpl(
      device_name: json['device_name'] as String?,
      device_display_name: json['device_display_name'] as String?,
      recent_thumb_url: json['recent_thumb_url'] as String?,
      recent_geo_position: (json['recent_geo_position'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$CameraDeviceImplToJson(_$CameraDeviceImpl instance) =>
    <String, dynamic>{
      'device_name': instance.device_name,
      'device_display_name': instance.device_display_name,
      'recent_thumb_url': instance.recent_thumb_url,
      'recent_geo_position': instance.recent_geo_position,
    };

_$CameraDeviceContainerImpl _$$CameraDeviceContainerImplFromJson(
        Map<String, dynamic> json) =>
    _$CameraDeviceContainerImpl(
      devices: (json['devices'] as List<dynamic>?)
          ?.map((e) => CameraDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CameraDeviceContainerImplToJson(
        _$CameraDeviceContainerImpl instance) =>
    <String, dynamic>{
      'devices': instance.devices,
    };

_$MediaUrlImpl _$$MediaUrlImplFromJson(Map<String, dynamic> json) =>
    _$MediaUrlImpl(
      private: json['private'] as String?,
    );

Map<String, dynamic> _$$MediaUrlImplToJson(_$MediaUrlImpl instance) =>
    <String, dynamic>{
      'private': instance.private,
    };

_$MediaUrlContainerImpl _$$MediaUrlContainerImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaUrlContainerImpl(
      media_url: (json['media_url'] as List<dynamic>?)
          ?.map((e) => RtmpContainer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MediaUrlContainerImplToJson(
        _$MediaUrlContainerImpl instance) =>
    <String, dynamic>{
      'media_url': instance.media_url,
    };

_$RtmpContainerImpl _$$RtmpContainerImplFromJson(Map<String, dynamic> json) =>
    _$RtmpContainerImpl(
      rtmp: json['rtmp'] == null
          ? null
          : Rtmp.fromJson(json['rtmp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RtmpContainerImplToJson(_$RtmpContainerImpl instance) =>
    <String, dynamic>{
      'rtmp': instance.rtmp,
    };

_$RtmpImpl _$$RtmpImplFromJson(Map<String, dynamic> json) => _$RtmpImpl(
      private: json['private'] as String?,
    );

Map<String, dynamic> _$$RtmpImplToJson(_$RtmpImpl instance) =>
    <String, dynamic>{
      'private': instance.private,
    };

_$NaviPointImpl _$$NaviPointImplFromJson(Map<String, dynamic> json) =>
    _$NaviPointImpl(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      s: (json['s'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$NaviPointImplToJson(_$NaviPointImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      's': instance.s,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      navi: json['navi'] == null
          ? null
          : NaviPoint.fromJson(json['navi'] as Map<String, dynamic>),
      trigger: json['trigger'] as String?,
      trigger_subtype: json['trigger_subtype'] as String?,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'navi': instance.navi,
      'trigger': instance.trigger,
      'trigger_subtype': instance.trigger_subtype,
    };

_$VideosImpl _$$VideosImplFromJson(Map<String, dynamic> json) => _$VideosImpl(
      upload_id: json['upload_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$VideosImplToJson(_$VideosImpl instance) =>
    <String, dynamic>{
      'upload_id': instance.upload_id,
      'name': instance.name,
    };

_$VideoEventImpl _$$VideoEventImplFromJson(Map<String, dynamic> json) =>
    _$VideoEventImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      timestamp: (json['timestamp'] as num?)?.toInt(),
      device: json['device'] == null
          ? null
          : CameraDevice.fromJson(json['device'] as Map<String, dynamic>),
      thumbnails: (json['thumbnails'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Videos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideoEventImplToJson(_$VideoEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'timestamp': instance.timestamp,
      'device': instance.device,
      'thumbnails': instance.thumbnails,
      'meta': instance.meta,
      'videos': instance.videos,
    };

_$VideoEventContainerImpl _$$VideoEventContainerImplFromJson(
        Map<String, dynamic> json) =>
    _$VideoEventContainerImpl(
      videoevents: (json['videoevents'] as List<dynamic>?)
          ?.map((e) => VideoEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideoEventContainerImplToJson(
        _$VideoEventContainerImpl instance) =>
    <String, dynamic>{
      'videoevents': instance.videoevents,
    };

_$CoordinatesImpl _$$CoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatesImpl(
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$$CoordinatesImplToJson(_$CoordinatesImpl instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
    };

_$LayerImpl _$$LayerImplFromJson(Map<String, dynamic> json) => _$LayerImpl(
      objects: (json['objects'] as List<dynamic>?)
          ?.map((e) => Coordinates.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LayerImplToJson(_$LayerImpl instance) =>
    <String, dynamic>{
      'objects': instance.objects,
    };

_$TrackImpl _$$TrackImplFromJson(Map<String, dynamic> json) => _$TrackImpl(
      layers: (json['layers'] as List<dynamic>?)
          ?.map((e) => Layer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TrackImplToJson(_$TrackImpl instance) =>
    <String, dynamic>{
      'layers': instance.layers,
    };
