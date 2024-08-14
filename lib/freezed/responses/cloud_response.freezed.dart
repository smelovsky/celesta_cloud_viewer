// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) {
  return _AuthToken.fromJson(json);
}

/// @nodoc
mixin _$AuthToken {
  String get session_id => throw _privateConstructorUsedError;
  String get session_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthTokenCopyWith<AuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenCopyWith<$Res> {
  factory $AuthTokenCopyWith(AuthToken value, $Res Function(AuthToken) then) =
      _$AuthTokenCopyWithImpl<$Res, AuthToken>;
  @useResult
  $Res call({String session_id, String session_type});
}

/// @nodoc
class _$AuthTokenCopyWithImpl<$Res, $Val extends AuthToken>
    implements $AuthTokenCopyWith<$Res> {
  _$AuthTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session_id = null,
    Object? session_type = null,
  }) {
    return _then(_value.copyWith(
      session_id: null == session_id
          ? _value.session_id
          : session_id // ignore: cast_nullable_to_non_nullable
              as String,
      session_type: null == session_type
          ? _value.session_type
          : session_type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthTokenImplCopyWith<$Res>
    implements $AuthTokenCopyWith<$Res> {
  factory _$$AuthTokenImplCopyWith(
          _$AuthTokenImpl value, $Res Function(_$AuthTokenImpl) then) =
      __$$AuthTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String session_id, String session_type});
}

/// @nodoc
class __$$AuthTokenImplCopyWithImpl<$Res>
    extends _$AuthTokenCopyWithImpl<$Res, _$AuthTokenImpl>
    implements _$$AuthTokenImplCopyWith<$Res> {
  __$$AuthTokenImplCopyWithImpl(
      _$AuthTokenImpl _value, $Res Function(_$AuthTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session_id = null,
    Object? session_type = null,
  }) {
    return _then(_$AuthTokenImpl(
      session_id: null == session_id
          ? _value.session_id
          : session_id // ignore: cast_nullable_to_non_nullable
              as String,
      session_type: null == session_type
          ? _value.session_type
          : session_type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthTokenImpl implements _AuthToken {
  const _$AuthTokenImpl({required this.session_id, required this.session_type});

  factory _$AuthTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokenImplFromJson(json);

  @override
  final String session_id;
  @override
  final String session_type;

  @override
  String toString() {
    return 'AuthToken(session_id: $session_id, session_type: $session_type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokenImpl &&
            (identical(other.session_id, session_id) ||
                other.session_id == session_id) &&
            (identical(other.session_type, session_type) ||
                other.session_type == session_type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, session_id, session_type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokenImplCopyWith<_$AuthTokenImpl> get copyWith =>
      __$$AuthTokenImplCopyWithImpl<_$AuthTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokenImplToJson(
      this,
    );
  }
}

abstract class _AuthToken implements AuthToken {
  const factory _AuthToken(
      {required final String session_id,
      required final String session_type}) = _$AuthTokenImpl;

  factory _AuthToken.fromJson(Map<String, dynamic> json) =
      _$AuthTokenImpl.fromJson;

  @override
  String get session_id;
  @override
  String get session_type;
  @override
  @JsonKey(ignore: true)
  _$$AuthTokenImplCopyWith<_$AuthTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CameraDevice _$CameraDeviceFromJson(Map<String, dynamic> json) {
  return _CameraDevice.fromJson(json);
}

/// @nodoc
mixin _$CameraDevice {
  String get device_uid => throw _privateConstructorUsedError;
  String get device_id => throw _privateConstructorUsedError;
  String get device_name => throw _privateConstructorUsedError;
  String get device_display_name => throw _privateConstructorUsedError;
  String get recent_thumb_url => throw _privateConstructorUsedError;
  List<double> get recent_geo_position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CameraDeviceCopyWith<CameraDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraDeviceCopyWith<$Res> {
  factory $CameraDeviceCopyWith(
          CameraDevice value, $Res Function(CameraDevice) then) =
      _$CameraDeviceCopyWithImpl<$Res, CameraDevice>;
  @useResult
  $Res call(
      {String device_uid,
      String device_id,
      String device_name,
      String device_display_name,
      String recent_thumb_url,
      List<double> recent_geo_position});
}

/// @nodoc
class _$CameraDeviceCopyWithImpl<$Res, $Val extends CameraDevice>
    implements $CameraDeviceCopyWith<$Res> {
  _$CameraDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device_uid = null,
    Object? device_id = null,
    Object? device_name = null,
    Object? device_display_name = null,
    Object? recent_thumb_url = null,
    Object? recent_geo_position = null,
  }) {
    return _then(_value.copyWith(
      device_uid: null == device_uid
          ? _value.device_uid
          : device_uid // ignore: cast_nullable_to_non_nullable
              as String,
      device_id: null == device_id
          ? _value.device_id
          : device_id // ignore: cast_nullable_to_non_nullable
              as String,
      device_name: null == device_name
          ? _value.device_name
          : device_name // ignore: cast_nullable_to_non_nullable
              as String,
      device_display_name: null == device_display_name
          ? _value.device_display_name
          : device_display_name // ignore: cast_nullable_to_non_nullable
              as String,
      recent_thumb_url: null == recent_thumb_url
          ? _value.recent_thumb_url
          : recent_thumb_url // ignore: cast_nullable_to_non_nullable
              as String,
      recent_geo_position: null == recent_geo_position
          ? _value.recent_geo_position
          : recent_geo_position // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraDeviceImplCopyWith<$Res>
    implements $CameraDeviceCopyWith<$Res> {
  factory _$$CameraDeviceImplCopyWith(
          _$CameraDeviceImpl value, $Res Function(_$CameraDeviceImpl) then) =
      __$$CameraDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String device_uid,
      String device_id,
      String device_name,
      String device_display_name,
      String recent_thumb_url,
      List<double> recent_geo_position});
}

/// @nodoc
class __$$CameraDeviceImplCopyWithImpl<$Res>
    extends _$CameraDeviceCopyWithImpl<$Res, _$CameraDeviceImpl>
    implements _$$CameraDeviceImplCopyWith<$Res> {
  __$$CameraDeviceImplCopyWithImpl(
      _$CameraDeviceImpl _value, $Res Function(_$CameraDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device_uid = null,
    Object? device_id = null,
    Object? device_name = null,
    Object? device_display_name = null,
    Object? recent_thumb_url = null,
    Object? recent_geo_position = null,
  }) {
    return _then(_$CameraDeviceImpl(
      device_uid: null == device_uid
          ? _value.device_uid
          : device_uid // ignore: cast_nullable_to_non_nullable
              as String,
      device_id: null == device_id
          ? _value.device_id
          : device_id // ignore: cast_nullable_to_non_nullable
              as String,
      device_name: null == device_name
          ? _value.device_name
          : device_name // ignore: cast_nullable_to_non_nullable
              as String,
      device_display_name: null == device_display_name
          ? _value.device_display_name
          : device_display_name // ignore: cast_nullable_to_non_nullable
              as String,
      recent_thumb_url: null == recent_thumb_url
          ? _value.recent_thumb_url
          : recent_thumb_url // ignore: cast_nullable_to_non_nullable
              as String,
      recent_geo_position: null == recent_geo_position
          ? _value._recent_geo_position
          : recent_geo_position // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CameraDeviceImpl implements _CameraDevice {
  const _$CameraDeviceImpl(
      {required this.device_uid,
      required this.device_id,
      required this.device_name,
      required this.device_display_name,
      required this.recent_thumb_url,
      required final List<double> recent_geo_position})
      : _recent_geo_position = recent_geo_position;

  factory _$CameraDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CameraDeviceImplFromJson(json);

  @override
  final String device_uid;
  @override
  final String device_id;
  @override
  final String device_name;
  @override
  final String device_display_name;
  @override
  final String recent_thumb_url;
  final List<double> _recent_geo_position;
  @override
  List<double> get recent_geo_position {
    if (_recent_geo_position is EqualUnmodifiableListView)
      return _recent_geo_position;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recent_geo_position);
  }

  @override
  String toString() {
    return 'CameraDevice(device_uid: $device_uid, device_id: $device_id, device_name: $device_name, device_display_name: $device_display_name, recent_thumb_url: $recent_thumb_url, recent_geo_position: $recent_geo_position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDeviceImpl &&
            (identical(other.device_uid, device_uid) ||
                other.device_uid == device_uid) &&
            (identical(other.device_id, device_id) ||
                other.device_id == device_id) &&
            (identical(other.device_name, device_name) ||
                other.device_name == device_name) &&
            (identical(other.device_display_name, device_display_name) ||
                other.device_display_name == device_display_name) &&
            (identical(other.recent_thumb_url, recent_thumb_url) ||
                other.recent_thumb_url == recent_thumb_url) &&
            const DeepCollectionEquality()
                .equals(other._recent_geo_position, _recent_geo_position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      device_uid,
      device_id,
      device_name,
      device_display_name,
      recent_thumb_url,
      const DeepCollectionEquality().hash(_recent_geo_position));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraDeviceImplCopyWith<_$CameraDeviceImpl> get copyWith =>
      __$$CameraDeviceImplCopyWithImpl<_$CameraDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CameraDeviceImplToJson(
      this,
    );
  }
}

abstract class _CameraDevice implements CameraDevice {
  const factory _CameraDevice(
      {required final String device_uid,
      required final String device_id,
      required final String device_name,
      required final String device_display_name,
      required final String recent_thumb_url,
      required final List<double> recent_geo_position}) = _$CameraDeviceImpl;

  factory _CameraDevice.fromJson(Map<String, dynamic> json) =
      _$CameraDeviceImpl.fromJson;

  @override
  String get device_uid;
  @override
  String get device_id;
  @override
  String get device_name;
  @override
  String get device_display_name;
  @override
  String get recent_thumb_url;
  @override
  List<double> get recent_geo_position;
  @override
  @JsonKey(ignore: true)
  _$$CameraDeviceImplCopyWith<_$CameraDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MewdiaUrl _$MewdiaUrlFromJson(Map<String, dynamic> json) {
  return _MewdiaUrl.fromJson(json);
}

/// @nodoc
mixin _$MewdiaUrl {
  String get private => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MewdiaUrlCopyWith<MewdiaUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MewdiaUrlCopyWith<$Res> {
  factory $MewdiaUrlCopyWith(MewdiaUrl value, $Res Function(MewdiaUrl) then) =
      _$MewdiaUrlCopyWithImpl<$Res, MewdiaUrl>;
  @useResult
  $Res call({String private});
}

/// @nodoc
class _$MewdiaUrlCopyWithImpl<$Res, $Val extends MewdiaUrl>
    implements $MewdiaUrlCopyWith<$Res> {
  _$MewdiaUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private = null,
  }) {
    return _then(_value.copyWith(
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MewdiaUrlImplCopyWith<$Res>
    implements $MewdiaUrlCopyWith<$Res> {
  factory _$$MewdiaUrlImplCopyWith(
          _$MewdiaUrlImpl value, $Res Function(_$MewdiaUrlImpl) then) =
      __$$MewdiaUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String private});
}

/// @nodoc
class __$$MewdiaUrlImplCopyWithImpl<$Res>
    extends _$MewdiaUrlCopyWithImpl<$Res, _$MewdiaUrlImpl>
    implements _$$MewdiaUrlImplCopyWith<$Res> {
  __$$MewdiaUrlImplCopyWithImpl(
      _$MewdiaUrlImpl _value, $Res Function(_$MewdiaUrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private = null,
  }) {
    return _then(_$MewdiaUrlImpl(
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MewdiaUrlImpl implements _MewdiaUrl {
  const _$MewdiaUrlImpl({required this.private});

  factory _$MewdiaUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$MewdiaUrlImplFromJson(json);

  @override
  final String private;

  @override
  String toString() {
    return 'MewdiaUrl(private: $private)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MewdiaUrlImpl &&
            (identical(other.private, private) || other.private == private));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, private);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MewdiaUrlImplCopyWith<_$MewdiaUrlImpl> get copyWith =>
      __$$MewdiaUrlImplCopyWithImpl<_$MewdiaUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MewdiaUrlImplToJson(
      this,
    );
  }
}

abstract class _MewdiaUrl implements MewdiaUrl {
  const factory _MewdiaUrl({required final String private}) = _$MewdiaUrlImpl;

  factory _MewdiaUrl.fromJson(Map<String, dynamic> json) =
      _$MewdiaUrlImpl.fromJson;

  @override
  String get private;
  @override
  @JsonKey(ignore: true)
  _$$MewdiaUrlImplCopyWith<_$MewdiaUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NaviPoint _$NaviPointFromJson(Map<String, dynamic> json) {
  return _NaviPoint.fromJson(json);
}

/// @nodoc
mixin _$NaviPoint {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  double get s => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NaviPointCopyWith<NaviPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaviPointCopyWith<$Res> {
  factory $NaviPointCopyWith(NaviPoint value, $Res Function(NaviPoint) then) =
      _$NaviPointCopyWithImpl<$Res, NaviPoint>;
  @useResult
  $Res call({double lat, double lon, double s});
}

/// @nodoc
class _$NaviPointCopyWithImpl<$Res, $Val extends NaviPoint>
    implements $NaviPointCopyWith<$Res> {
  _$NaviPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? s = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      s: null == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NaviPointImplCopyWith<$Res>
    implements $NaviPointCopyWith<$Res> {
  factory _$$NaviPointImplCopyWith(
          _$NaviPointImpl value, $Res Function(_$NaviPointImpl) then) =
      __$$NaviPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon, double s});
}

/// @nodoc
class __$$NaviPointImplCopyWithImpl<$Res>
    extends _$NaviPointCopyWithImpl<$Res, _$NaviPointImpl>
    implements _$$NaviPointImplCopyWith<$Res> {
  __$$NaviPointImplCopyWithImpl(
      _$NaviPointImpl _value, $Res Function(_$NaviPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? s = null,
  }) {
    return _then(_$NaviPointImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      s: null == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NaviPointImpl implements _NaviPoint {
  const _$NaviPointImpl(
      {required this.lat, required this.lon, required this.s});

  factory _$NaviPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$NaviPointImplFromJson(json);

  @override
  final double lat;
  @override
  final double lon;
  @override
  final double s;

  @override
  String toString() {
    return 'NaviPoint(lat: $lat, lon: $lon, s: $s)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NaviPointImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.s, s) || other.s == s));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lon, s);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NaviPointImplCopyWith<_$NaviPointImpl> get copyWith =>
      __$$NaviPointImplCopyWithImpl<_$NaviPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NaviPointImplToJson(
      this,
    );
  }
}

abstract class _NaviPoint implements NaviPoint {
  const factory _NaviPoint(
      {required final double lat,
      required final double lon,
      required final double s}) = _$NaviPointImpl;

  factory _NaviPoint.fromJson(Map<String, dynamic> json) =
      _$NaviPointImpl.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  double get s;
  @override
  @JsonKey(ignore: true)
  _$$NaviPointImplCopyWith<_$NaviPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  NaviPoint get navi => throw _privateConstructorUsedError;
  String get trigger => throw _privateConstructorUsedError;
  String get trigger_subtype => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({NaviPoint navi, String trigger, String trigger_subtype});

  $NaviPointCopyWith<$Res> get navi;
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navi = null,
    Object? trigger = null,
    Object? trigger_subtype = null,
  }) {
    return _then(_value.copyWith(
      navi: null == navi
          ? _value.navi
          : navi // ignore: cast_nullable_to_non_nullable
              as NaviPoint,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String,
      trigger_subtype: null == trigger_subtype
          ? _value.trigger_subtype
          : trigger_subtype // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NaviPointCopyWith<$Res> get navi {
    return $NaviPointCopyWith<$Res>(_value.navi, (value) {
      return _then(_value.copyWith(navi: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NaviPoint navi, String trigger, String trigger_subtype});

  @override
  $NaviPointCopyWith<$Res> get navi;
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navi = null,
    Object? trigger = null,
    Object? trigger_subtype = null,
  }) {
    return _then(_$MetaImpl(
      navi: null == navi
          ? _value.navi
          : navi // ignore: cast_nullable_to_non_nullable
              as NaviPoint,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String,
      trigger_subtype: null == trigger_subtype
          ? _value.trigger_subtype
          : trigger_subtype // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl(
      {required this.navi,
      required this.trigger,
      required this.trigger_subtype});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  final NaviPoint navi;
  @override
  final String trigger;
  @override
  final String trigger_subtype;

  @override
  String toString() {
    return 'Meta(navi: $navi, trigger: $trigger, trigger_subtype: $trigger_subtype)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.navi, navi) || other.navi == navi) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.trigger_subtype, trigger_subtype) ||
                other.trigger_subtype == trigger_subtype));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, navi, trigger, trigger_subtype);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {required final NaviPoint navi,
      required final String trigger,
      required final String trigger_subtype}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  NaviPoint get navi;
  @override
  String get trigger;
  @override
  String get trigger_subtype;
  @override
  @JsonKey(ignore: true)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoEvent _$VideoEventFromJson(Map<String, dynamic> json) {
  return _VideoEvent.fromJson(json);
}

/// @nodoc
mixin _$VideoEvent {
  String get id => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  CameraDevice get device => throw _privateConstructorUsedError;
  List<String> get thumbnails => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoEventCopyWith<VideoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoEventCopyWith<$Res> {
  factory $VideoEventCopyWith(
          VideoEvent value, $Res Function(VideoEvent) then) =
      _$VideoEventCopyWithImpl<$Res, VideoEvent>;
  @useResult
  $Res call(
      {String id,
      int timestamp,
      CameraDevice device,
      List<String> thumbnails,
      Meta meta});

  $CameraDeviceCopyWith<$Res> get device;
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$VideoEventCopyWithImpl<$Res, $Val extends VideoEvent>
    implements $VideoEventCopyWith<$Res> {
  _$VideoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? device = null,
    Object? thumbnails = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as CameraDevice,
      thumbnails: null == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CameraDeviceCopyWith<$Res> get device {
    return $CameraDeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VideoEventImplCopyWith<$Res>
    implements $VideoEventCopyWith<$Res> {
  factory _$$VideoEventImplCopyWith(
          _$VideoEventImpl value, $Res Function(_$VideoEventImpl) then) =
      __$$VideoEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int timestamp,
      CameraDevice device,
      List<String> thumbnails,
      Meta meta});

  @override
  $CameraDeviceCopyWith<$Res> get device;
  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$VideoEventImplCopyWithImpl<$Res>
    extends _$VideoEventCopyWithImpl<$Res, _$VideoEventImpl>
    implements _$$VideoEventImplCopyWith<$Res> {
  __$$VideoEventImplCopyWithImpl(
      _$VideoEventImpl _value, $Res Function(_$VideoEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? device = null,
    Object? thumbnails = null,
    Object? meta = null,
  }) {
    return _then(_$VideoEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as CameraDevice,
      thumbnails: null == thumbnails
          ? _value._thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoEventImpl implements _VideoEvent {
  const _$VideoEventImpl(
      {required this.id,
      required this.timestamp,
      required this.device,
      required final List<String> thumbnails,
      required this.meta})
      : _thumbnails = thumbnails;

  factory _$VideoEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoEventImplFromJson(json);

  @override
  final String id;
  @override
  final int timestamp;
  @override
  final CameraDevice device;
  final List<String> _thumbnails;
  @override
  List<String> get thumbnails {
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnails);
  }

  @override
  final Meta meta;

  @override
  String toString() {
    return 'VideoEvent(id: $id, timestamp: $timestamp, device: $device, thumbnails: $thumbnails, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.device, device) || other.device == device) &&
            const DeepCollectionEquality()
                .equals(other._thumbnails, _thumbnails) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, timestamp, device,
      const DeepCollectionEquality().hash(_thumbnails), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoEventImplCopyWith<_$VideoEventImpl> get copyWith =>
      __$$VideoEventImplCopyWithImpl<_$VideoEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoEventImplToJson(
      this,
    );
  }
}

abstract class _VideoEvent implements VideoEvent {
  const factory _VideoEvent(
      {required final String id,
      required final int timestamp,
      required final CameraDevice device,
      required final List<String> thumbnails,
      required final Meta meta}) = _$VideoEventImpl;

  factory _VideoEvent.fromJson(Map<String, dynamic> json) =
      _$VideoEventImpl.fromJson;

  @override
  String get id;
  @override
  int get timestamp;
  @override
  CameraDevice get device;
  @override
  List<String> get thumbnails;
  @override
  Meta get meta;
  @override
  @JsonKey(ignore: true)
  _$$VideoEventImplCopyWith<_$VideoEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
