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
      device_uid: json['device_uid'] as String,
      device_id: json['device_id'] as String,
      device_name: json['device_name'] as String,
      device_display_name: json['device_display_name'] as String,
      recent_thumb_url: json['recent_thumb_url'] as String,
      recent_geo_position: (json['recent_geo_position'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$CameraDeviceImplToJson(_$CameraDeviceImpl instance) =>
    <String, dynamic>{
      'device_uid': instance.device_uid,
      'device_id': instance.device_id,
      'device_name': instance.device_name,
      'device_display_name': instance.device_display_name,
      'recent_thumb_url': instance.recent_thumb_url,
      'recent_geo_position': instance.recent_geo_position,
    };

_$MewdiaUrlImpl _$$MewdiaUrlImplFromJson(Map<String, dynamic> json) =>
    _$MewdiaUrlImpl(
      private: json['private'] as String,
    );

Map<String, dynamic> _$$MewdiaUrlImplToJson(_$MewdiaUrlImpl instance) =>
    <String, dynamic>{
      'private': instance.private,
    };

_$NaviPointImpl _$$NaviPointImplFromJson(Map<String, dynamic> json) =>
    _$NaviPointImpl(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      s: (json['s'] as num).toDouble(),
    );

Map<String, dynamic> _$$NaviPointImplToJson(_$NaviPointImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      's': instance.s,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      navi: NaviPoint.fromJson(json['navi'] as Map<String, dynamic>),
      trigger: json['trigger'] as String,
      trigger_subtype: json['trigger_subtype'] as String,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'navi': instance.navi,
      'trigger': instance.trigger,
      'trigger_subtype': instance.trigger_subtype,
    };

_$VideoEventImpl _$$VideoEventImplFromJson(Map<String, dynamic> json) =>
    _$VideoEventImpl(
      id: json['id'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      device: CameraDevice.fromJson(json['device'] as Map<String, dynamic>),
      thumbnails: (json['thumbnails'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VideoEventImplToJson(_$VideoEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'device': instance.device,
      'thumbnails': instance.thumbnails,
      'meta': instance.meta,
    };
