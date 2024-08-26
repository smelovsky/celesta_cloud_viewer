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
  String? get device_name => throw _privateConstructorUsedError;
  String? get device_display_name => throw _privateConstructorUsedError;
  String? get recent_thumb_url => throw _privateConstructorUsedError;
  List<double>? get recent_geo_position => throw _privateConstructorUsedError;

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
      {String? device_name,
      String? device_display_name,
      String? recent_thumb_url,
      List<double>? recent_geo_position});
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
    Object? device_name = freezed,
    Object? device_display_name = freezed,
    Object? recent_thumb_url = freezed,
    Object? recent_geo_position = freezed,
  }) {
    return _then(_value.copyWith(
      device_name: freezed == device_name
          ? _value.device_name
          : device_name // ignore: cast_nullable_to_non_nullable
              as String?,
      device_display_name: freezed == device_display_name
          ? _value.device_display_name
          : device_display_name // ignore: cast_nullable_to_non_nullable
              as String?,
      recent_thumb_url: freezed == recent_thumb_url
          ? _value.recent_thumb_url
          : recent_thumb_url // ignore: cast_nullable_to_non_nullable
              as String?,
      recent_geo_position: freezed == recent_geo_position
          ? _value.recent_geo_position
          : recent_geo_position // ignore: cast_nullable_to_non_nullable
              as List<double>?,
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
      {String? device_name,
      String? device_display_name,
      String? recent_thumb_url,
      List<double>? recent_geo_position});
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
    Object? device_name = freezed,
    Object? device_display_name = freezed,
    Object? recent_thumb_url = freezed,
    Object? recent_geo_position = freezed,
  }) {
    return _then(_$CameraDeviceImpl(
      device_name: freezed == device_name
          ? _value.device_name
          : device_name // ignore: cast_nullable_to_non_nullable
              as String?,
      device_display_name: freezed == device_display_name
          ? _value.device_display_name
          : device_display_name // ignore: cast_nullable_to_non_nullable
              as String?,
      recent_thumb_url: freezed == recent_thumb_url
          ? _value.recent_thumb_url
          : recent_thumb_url // ignore: cast_nullable_to_non_nullable
              as String?,
      recent_geo_position: freezed == recent_geo_position
          ? _value._recent_geo_position
          : recent_geo_position // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CameraDeviceImpl implements _CameraDevice {
  const _$CameraDeviceImpl(
      {required this.device_name,
      required this.device_display_name,
      required this.recent_thumb_url,
      required final List<double>? recent_geo_position})
      : _recent_geo_position = recent_geo_position;

  factory _$CameraDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CameraDeviceImplFromJson(json);

  @override
  final String? device_name;
  @override
  final String? device_display_name;
  @override
  final String? recent_thumb_url;
  final List<double>? _recent_geo_position;
  @override
  List<double>? get recent_geo_position {
    final value = _recent_geo_position;
    if (value == null) return null;
    if (_recent_geo_position is EqualUnmodifiableListView)
      return _recent_geo_position;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CameraDevice(device_name: $device_name, device_display_name: $device_display_name, recent_thumb_url: $recent_thumb_url, recent_geo_position: $recent_geo_position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDeviceImpl &&
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
      {required final String? device_name,
      required final String? device_display_name,
      required final String? recent_thumb_url,
      required final List<double>? recent_geo_position}) = _$CameraDeviceImpl;

  factory _CameraDevice.fromJson(Map<String, dynamic> json) =
      _$CameraDeviceImpl.fromJson;

  @override
  String? get device_name;
  @override
  String? get device_display_name;
  @override
  String? get recent_thumb_url;
  @override
  List<double>? get recent_geo_position;
  @override
  @JsonKey(ignore: true)
  _$$CameraDeviceImplCopyWith<_$CameraDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CameraDeviceContainer _$CameraDeviceContainerFromJson(
    Map<String, dynamic> json) {
  return _CameraDeviceContainer.fromJson(json);
}

/// @nodoc
mixin _$CameraDeviceContainer {
  List<CameraDevice>? get devices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CameraDeviceContainerCopyWith<CameraDeviceContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraDeviceContainerCopyWith<$Res> {
  factory $CameraDeviceContainerCopyWith(CameraDeviceContainer value,
          $Res Function(CameraDeviceContainer) then) =
      _$CameraDeviceContainerCopyWithImpl<$Res, CameraDeviceContainer>;
  @useResult
  $Res call({List<CameraDevice>? devices});
}

/// @nodoc
class _$CameraDeviceContainerCopyWithImpl<$Res,
        $Val extends CameraDeviceContainer>
    implements $CameraDeviceContainerCopyWith<$Res> {
  _$CameraDeviceContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_value.copyWith(
      devices: freezed == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<CameraDevice>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraDeviceContainerImplCopyWith<$Res>
    implements $CameraDeviceContainerCopyWith<$Res> {
  factory _$$CameraDeviceContainerImplCopyWith(
          _$CameraDeviceContainerImpl value,
          $Res Function(_$CameraDeviceContainerImpl) then) =
      __$$CameraDeviceContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CameraDevice>? devices});
}

/// @nodoc
class __$$CameraDeviceContainerImplCopyWithImpl<$Res>
    extends _$CameraDeviceContainerCopyWithImpl<$Res,
        _$CameraDeviceContainerImpl>
    implements _$$CameraDeviceContainerImplCopyWith<$Res> {
  __$$CameraDeviceContainerImplCopyWithImpl(_$CameraDeviceContainerImpl _value,
      $Res Function(_$CameraDeviceContainerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_$CameraDeviceContainerImpl(
      devices: freezed == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<CameraDevice>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CameraDeviceContainerImpl implements _CameraDeviceContainer {
  const _$CameraDeviceContainerImpl(
      {required final List<CameraDevice>? devices})
      : _devices = devices;

  factory _$CameraDeviceContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CameraDeviceContainerImplFromJson(json);

  final List<CameraDevice>? _devices;
  @override
  List<CameraDevice>? get devices {
    final value = _devices;
    if (value == null) return null;
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CameraDeviceContainer(devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDeviceContainerImpl &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraDeviceContainerImplCopyWith<_$CameraDeviceContainerImpl>
      get copyWith => __$$CameraDeviceContainerImplCopyWithImpl<
          _$CameraDeviceContainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CameraDeviceContainerImplToJson(
      this,
    );
  }
}

abstract class _CameraDeviceContainer implements CameraDeviceContainer {
  const factory _CameraDeviceContainer(
          {required final List<CameraDevice>? devices}) =
      _$CameraDeviceContainerImpl;

  factory _CameraDeviceContainer.fromJson(Map<String, dynamic> json) =
      _$CameraDeviceContainerImpl.fromJson;

  @override
  List<CameraDevice>? get devices;
  @override
  @JsonKey(ignore: true)
  _$$CameraDeviceContainerImplCopyWith<_$CameraDeviceContainerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MediaUrl _$MediaUrlFromJson(Map<String, dynamic> json) {
  return _MediaUrl.fromJson(json);
}

/// @nodoc
mixin _$MediaUrl {
  String? get private => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaUrlCopyWith<MediaUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaUrlCopyWith<$Res> {
  factory $MediaUrlCopyWith(MediaUrl value, $Res Function(MediaUrl) then) =
      _$MediaUrlCopyWithImpl<$Res, MediaUrl>;
  @useResult
  $Res call({String? private});
}

/// @nodoc
class _$MediaUrlCopyWithImpl<$Res, $Val extends MediaUrl>
    implements $MediaUrlCopyWith<$Res> {
  _$MediaUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private = freezed,
  }) {
    return _then(_value.copyWith(
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaUrlImplCopyWith<$Res>
    implements $MediaUrlCopyWith<$Res> {
  factory _$$MediaUrlImplCopyWith(
          _$MediaUrlImpl value, $Res Function(_$MediaUrlImpl) then) =
      __$$MediaUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? private});
}

/// @nodoc
class __$$MediaUrlImplCopyWithImpl<$Res>
    extends _$MediaUrlCopyWithImpl<$Res, _$MediaUrlImpl>
    implements _$$MediaUrlImplCopyWith<$Res> {
  __$$MediaUrlImplCopyWithImpl(
      _$MediaUrlImpl _value, $Res Function(_$MediaUrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private = freezed,
  }) {
    return _then(_$MediaUrlImpl(
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaUrlImpl implements _MediaUrl {
  const _$MediaUrlImpl({required this.private});

  factory _$MediaUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaUrlImplFromJson(json);

  @override
  final String? private;

  @override
  String toString() {
    return 'MediaUrl(private: $private)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaUrlImpl &&
            (identical(other.private, private) || other.private == private));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, private);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaUrlImplCopyWith<_$MediaUrlImpl> get copyWith =>
      __$$MediaUrlImplCopyWithImpl<_$MediaUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaUrlImplToJson(
      this,
    );
  }
}

abstract class _MediaUrl implements MediaUrl {
  const factory _MediaUrl({required final String? private}) = _$MediaUrlImpl;

  factory _MediaUrl.fromJson(Map<String, dynamic> json) =
      _$MediaUrlImpl.fromJson;

  @override
  String? get private;
  @override
  @JsonKey(ignore: true)
  _$$MediaUrlImplCopyWith<_$MediaUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaUrlContainer _$MediaUrlContainerFromJson(Map<String, dynamic> json) {
  return _MediaUrlContainer.fromJson(json);
}

/// @nodoc
mixin _$MediaUrlContainer {
  List<RtmpContainer>? get media_url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaUrlContainerCopyWith<MediaUrlContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaUrlContainerCopyWith<$Res> {
  factory $MediaUrlContainerCopyWith(
          MediaUrlContainer value, $Res Function(MediaUrlContainer) then) =
      _$MediaUrlContainerCopyWithImpl<$Res, MediaUrlContainer>;
  @useResult
  $Res call({List<RtmpContainer>? media_url});
}

/// @nodoc
class _$MediaUrlContainerCopyWithImpl<$Res, $Val extends MediaUrlContainer>
    implements $MediaUrlContainerCopyWith<$Res> {
  _$MediaUrlContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media_url = freezed,
  }) {
    return _then(_value.copyWith(
      media_url: freezed == media_url
          ? _value.media_url
          : media_url // ignore: cast_nullable_to_non_nullable
              as List<RtmpContainer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaUrlContainerImplCopyWith<$Res>
    implements $MediaUrlContainerCopyWith<$Res> {
  factory _$$MediaUrlContainerImplCopyWith(_$MediaUrlContainerImpl value,
          $Res Function(_$MediaUrlContainerImpl) then) =
      __$$MediaUrlContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RtmpContainer>? media_url});
}

/// @nodoc
class __$$MediaUrlContainerImplCopyWithImpl<$Res>
    extends _$MediaUrlContainerCopyWithImpl<$Res, _$MediaUrlContainerImpl>
    implements _$$MediaUrlContainerImplCopyWith<$Res> {
  __$$MediaUrlContainerImplCopyWithImpl(_$MediaUrlContainerImpl _value,
      $Res Function(_$MediaUrlContainerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media_url = freezed,
  }) {
    return _then(_$MediaUrlContainerImpl(
      media_url: freezed == media_url
          ? _value._media_url
          : media_url // ignore: cast_nullable_to_non_nullable
              as List<RtmpContainer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaUrlContainerImpl implements _MediaUrlContainer {
  const _$MediaUrlContainerImpl({required final List<RtmpContainer>? media_url})
      : _media_url = media_url;

  factory _$MediaUrlContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaUrlContainerImplFromJson(json);

  final List<RtmpContainer>? _media_url;
  @override
  List<RtmpContainer>? get media_url {
    final value = _media_url;
    if (value == null) return null;
    if (_media_url is EqualUnmodifiableListView) return _media_url;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MediaUrlContainer(media_url: $media_url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaUrlContainerImpl &&
            const DeepCollectionEquality()
                .equals(other._media_url, _media_url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_media_url));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaUrlContainerImplCopyWith<_$MediaUrlContainerImpl> get copyWith =>
      __$$MediaUrlContainerImplCopyWithImpl<_$MediaUrlContainerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaUrlContainerImplToJson(
      this,
    );
  }
}

abstract class _MediaUrlContainer implements MediaUrlContainer {
  const factory _MediaUrlContainer(
          {required final List<RtmpContainer>? media_url}) =
      _$MediaUrlContainerImpl;

  factory _MediaUrlContainer.fromJson(Map<String, dynamic> json) =
      _$MediaUrlContainerImpl.fromJson;

  @override
  List<RtmpContainer>? get media_url;
  @override
  @JsonKey(ignore: true)
  _$$MediaUrlContainerImplCopyWith<_$MediaUrlContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RtmpContainer _$RtmpContainerFromJson(Map<String, dynamic> json) {
  return _RtmpContainer.fromJson(json);
}

/// @nodoc
mixin _$RtmpContainer {
  Rtmp? get rtmp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RtmpContainerCopyWith<RtmpContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RtmpContainerCopyWith<$Res> {
  factory $RtmpContainerCopyWith(
          RtmpContainer value, $Res Function(RtmpContainer) then) =
      _$RtmpContainerCopyWithImpl<$Res, RtmpContainer>;
  @useResult
  $Res call({Rtmp? rtmp});

  $RtmpCopyWith<$Res>? get rtmp;
}

/// @nodoc
class _$RtmpContainerCopyWithImpl<$Res, $Val extends RtmpContainer>
    implements $RtmpContainerCopyWith<$Res> {
  _$RtmpContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rtmp = freezed,
  }) {
    return _then(_value.copyWith(
      rtmp: freezed == rtmp
          ? _value.rtmp
          : rtmp // ignore: cast_nullable_to_non_nullable
              as Rtmp?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RtmpCopyWith<$Res>? get rtmp {
    if (_value.rtmp == null) {
      return null;
    }

    return $RtmpCopyWith<$Res>(_value.rtmp!, (value) {
      return _then(_value.copyWith(rtmp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RtmpContainerImplCopyWith<$Res>
    implements $RtmpContainerCopyWith<$Res> {
  factory _$$RtmpContainerImplCopyWith(
          _$RtmpContainerImpl value, $Res Function(_$RtmpContainerImpl) then) =
      __$$RtmpContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Rtmp? rtmp});

  @override
  $RtmpCopyWith<$Res>? get rtmp;
}

/// @nodoc
class __$$RtmpContainerImplCopyWithImpl<$Res>
    extends _$RtmpContainerCopyWithImpl<$Res, _$RtmpContainerImpl>
    implements _$$RtmpContainerImplCopyWith<$Res> {
  __$$RtmpContainerImplCopyWithImpl(
      _$RtmpContainerImpl _value, $Res Function(_$RtmpContainerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rtmp = freezed,
  }) {
    return _then(_$RtmpContainerImpl(
      rtmp: freezed == rtmp
          ? _value.rtmp
          : rtmp // ignore: cast_nullable_to_non_nullable
              as Rtmp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RtmpContainerImpl implements _RtmpContainer {
  const _$RtmpContainerImpl({required this.rtmp});

  factory _$RtmpContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$RtmpContainerImplFromJson(json);

  @override
  final Rtmp? rtmp;

  @override
  String toString() {
    return 'RtmpContainer(rtmp: $rtmp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RtmpContainerImpl &&
            (identical(other.rtmp, rtmp) || other.rtmp == rtmp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rtmp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RtmpContainerImplCopyWith<_$RtmpContainerImpl> get copyWith =>
      __$$RtmpContainerImplCopyWithImpl<_$RtmpContainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RtmpContainerImplToJson(
      this,
    );
  }
}

abstract class _RtmpContainer implements RtmpContainer {
  const factory _RtmpContainer({required final Rtmp? rtmp}) =
      _$RtmpContainerImpl;

  factory _RtmpContainer.fromJson(Map<String, dynamic> json) =
      _$RtmpContainerImpl.fromJson;

  @override
  Rtmp? get rtmp;
  @override
  @JsonKey(ignore: true)
  _$$RtmpContainerImplCopyWith<_$RtmpContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Rtmp _$RtmpFromJson(Map<String, dynamic> json) {
  return _Rtmp.fromJson(json);
}

/// @nodoc
mixin _$Rtmp {
  String? get private => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RtmpCopyWith<Rtmp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RtmpCopyWith<$Res> {
  factory $RtmpCopyWith(Rtmp value, $Res Function(Rtmp) then) =
      _$RtmpCopyWithImpl<$Res, Rtmp>;
  @useResult
  $Res call({String? private});
}

/// @nodoc
class _$RtmpCopyWithImpl<$Res, $Val extends Rtmp>
    implements $RtmpCopyWith<$Res> {
  _$RtmpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private = freezed,
  }) {
    return _then(_value.copyWith(
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RtmpImplCopyWith<$Res> implements $RtmpCopyWith<$Res> {
  factory _$$RtmpImplCopyWith(
          _$RtmpImpl value, $Res Function(_$RtmpImpl) then) =
      __$$RtmpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? private});
}

/// @nodoc
class __$$RtmpImplCopyWithImpl<$Res>
    extends _$RtmpCopyWithImpl<$Res, _$RtmpImpl>
    implements _$$RtmpImplCopyWith<$Res> {
  __$$RtmpImplCopyWithImpl(_$RtmpImpl _value, $Res Function(_$RtmpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private = freezed,
  }) {
    return _then(_$RtmpImpl(
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RtmpImpl implements _Rtmp {
  const _$RtmpImpl({required this.private});

  factory _$RtmpImpl.fromJson(Map<String, dynamic> json) =>
      _$$RtmpImplFromJson(json);

  @override
  final String? private;

  @override
  String toString() {
    return 'Rtmp(private: $private)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RtmpImpl &&
            (identical(other.private, private) || other.private == private));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, private);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RtmpImplCopyWith<_$RtmpImpl> get copyWith =>
      __$$RtmpImplCopyWithImpl<_$RtmpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RtmpImplToJson(
      this,
    );
  }
}

abstract class _Rtmp implements Rtmp {
  const factory _Rtmp({required final String? private}) = _$RtmpImpl;

  factory _Rtmp.fromJson(Map<String, dynamic> json) = _$RtmpImpl.fromJson;

  @override
  String? get private;
  @override
  @JsonKey(ignore: true)
  _$$RtmpImplCopyWith<_$RtmpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NaviPoint _$NaviPointFromJson(Map<String, dynamic> json) {
  return _NaviPoint.fromJson(json);
}

/// @nodoc
mixin _$NaviPoint {
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  double? get s => throw _privateConstructorUsedError;

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
  $Res call({double? lat, double? lon, double? s});
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
    Object? lat = freezed,
    Object? lon = freezed,
    Object? s = freezed,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      s: freezed == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as double?,
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
  $Res call({double? lat, double? lon, double? s});
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
    Object? lat = freezed,
    Object? lon = freezed,
    Object? s = freezed,
  }) {
    return _then(_$NaviPointImpl(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      s: freezed == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as double?,
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
  final double? lat;
  @override
  final double? lon;
  @override
  final double? s;

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
      {required final double? lat,
      required final double? lon,
      required final double? s}) = _$NaviPointImpl;

  factory _NaviPoint.fromJson(Map<String, dynamic> json) =
      _$NaviPointImpl.fromJson;

  @override
  double? get lat;
  @override
  double? get lon;
  @override
  double? get s;
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
  NaviPoint? get navi => throw _privateConstructorUsedError;
  String? get trigger => throw _privateConstructorUsedError;
  String? get trigger_subtype => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({NaviPoint? navi, String? trigger, String? trigger_subtype});

  $NaviPointCopyWith<$Res>? get navi;
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
    Object? navi = freezed,
    Object? trigger = freezed,
    Object? trigger_subtype = freezed,
  }) {
    return _then(_value.copyWith(
      navi: freezed == navi
          ? _value.navi
          : navi // ignore: cast_nullable_to_non_nullable
              as NaviPoint?,
      trigger: freezed == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String?,
      trigger_subtype: freezed == trigger_subtype
          ? _value.trigger_subtype
          : trigger_subtype // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NaviPointCopyWith<$Res>? get navi {
    if (_value.navi == null) {
      return null;
    }

    return $NaviPointCopyWith<$Res>(_value.navi!, (value) {
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
  $Res call({NaviPoint? navi, String? trigger, String? trigger_subtype});

  @override
  $NaviPointCopyWith<$Res>? get navi;
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
    Object? navi = freezed,
    Object? trigger = freezed,
    Object? trigger_subtype = freezed,
  }) {
    return _then(_$MetaImpl(
      navi: freezed == navi
          ? _value.navi
          : navi // ignore: cast_nullable_to_non_nullable
              as NaviPoint?,
      trigger: freezed == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String?,
      trigger_subtype: freezed == trigger_subtype
          ? _value.trigger_subtype
          : trigger_subtype // ignore: cast_nullable_to_non_nullable
              as String?,
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
  final NaviPoint? navi;
  @override
  final String? trigger;
  @override
  final String? trigger_subtype;

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
      {required final NaviPoint? navi,
      required final String? trigger,
      required final String? trigger_subtype}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  NaviPoint? get navi;
  @override
  String? get trigger;
  @override
  String? get trigger_subtype;
  @override
  @JsonKey(ignore: true)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Videos _$VideosFromJson(Map<String, dynamic> json) {
  return _Videos.fromJson(json);
}

/// @nodoc
mixin _$Videos {
  String? get upload_id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideosCopyWith<Videos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideosCopyWith<$Res> {
  factory $VideosCopyWith(Videos value, $Res Function(Videos) then) =
      _$VideosCopyWithImpl<$Res, Videos>;
  @useResult
  $Res call({String? upload_id, String? name});
}

/// @nodoc
class _$VideosCopyWithImpl<$Res, $Val extends Videos>
    implements $VideosCopyWith<$Res> {
  _$VideosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upload_id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      upload_id: freezed == upload_id
          ? _value.upload_id
          : upload_id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideosImplCopyWith<$Res> implements $VideosCopyWith<$Res> {
  factory _$$VideosImplCopyWith(
          _$VideosImpl value, $Res Function(_$VideosImpl) then) =
      __$$VideosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? upload_id, String? name});
}

/// @nodoc
class __$$VideosImplCopyWithImpl<$Res>
    extends _$VideosCopyWithImpl<$Res, _$VideosImpl>
    implements _$$VideosImplCopyWith<$Res> {
  __$$VideosImplCopyWithImpl(
      _$VideosImpl _value, $Res Function(_$VideosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upload_id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$VideosImpl(
      upload_id: freezed == upload_id
          ? _value.upload_id
          : upload_id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideosImpl implements _Videos {
  const _$VideosImpl({required this.upload_id, required this.name});

  factory _$VideosImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideosImplFromJson(json);

  @override
  final String? upload_id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Videos(upload_id: $upload_id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideosImpl &&
            (identical(other.upload_id, upload_id) ||
                other.upload_id == upload_id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, upload_id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideosImplCopyWith<_$VideosImpl> get copyWith =>
      __$$VideosImplCopyWithImpl<_$VideosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideosImplToJson(
      this,
    );
  }
}

abstract class _Videos implements Videos {
  const factory _Videos(
      {required final String? upload_id,
      required final String? name}) = _$VideosImpl;

  factory _Videos.fromJson(Map<String, dynamic> json) = _$VideosImpl.fromJson;

  @override
  String? get upload_id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$VideosImplCopyWith<_$VideosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoEvent _$VideoEventFromJson(Map<String, dynamic> json) {
  return _VideoEvent.fromJson(json);
}

/// @nodoc
mixin _$VideoEvent {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;
  CameraDevice? get device => throw _privateConstructorUsedError;
  List<String>? get thumbnails => throw _privateConstructorUsedError;
  Meta? get meta => throw _privateConstructorUsedError;
  List<Videos>? get videos => throw _privateConstructorUsedError;

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
      {String? id,
      String? name,
      int? timestamp,
      CameraDevice? device,
      List<String>? thumbnails,
      Meta? meta,
      List<Videos>? videos});

  $CameraDeviceCopyWith<$Res>? get device;
  $MetaCopyWith<$Res>? get meta;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? timestamp = freezed,
    Object? device = freezed,
    Object? thumbnails = freezed,
    Object? meta = freezed,
    Object? videos = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as CameraDevice?,
      thumbnails: freezed == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Videos>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CameraDeviceCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $CameraDeviceCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
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
      {String? id,
      String? name,
      int? timestamp,
      CameraDevice? device,
      List<String>? thumbnails,
      Meta? meta,
      List<Videos>? videos});

  @override
  $CameraDeviceCopyWith<$Res>? get device;
  @override
  $MetaCopyWith<$Res>? get meta;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? timestamp = freezed,
    Object? device = freezed,
    Object? thumbnails = freezed,
    Object? meta = freezed,
    Object? videos = freezed,
  }) {
    return _then(_$VideoEventImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as CameraDevice?,
      thumbnails: freezed == thumbnails
          ? _value._thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Videos>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoEventImpl implements _VideoEvent {
  const _$VideoEventImpl(
      {required this.id,
      required this.name,
      required this.timestamp,
      required this.device,
      required final List<String>? thumbnails,
      required this.meta,
      required final List<Videos>? videos})
      : _thumbnails = thumbnails,
        _videos = videos;

  factory _$VideoEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoEventImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? timestamp;
  @override
  final CameraDevice? device;
  final List<String>? _thumbnails;
  @override
  List<String>? get thumbnails {
    final value = _thumbnails;
    if (value == null) return null;
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Meta? meta;
  final List<Videos>? _videos;
  @override
  List<Videos>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VideoEvent(id: $id, name: $name, timestamp: $timestamp, device: $device, thumbnails: $thumbnails, meta: $meta, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.device, device) || other.device == device) &&
            const DeepCollectionEquality()
                .equals(other._thumbnails, _thumbnails) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      timestamp,
      device,
      const DeepCollectionEquality().hash(_thumbnails),
      meta,
      const DeepCollectionEquality().hash(_videos));

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
      {required final String? id,
      required final String? name,
      required final int? timestamp,
      required final CameraDevice? device,
      required final List<String>? thumbnails,
      required final Meta? meta,
      required final List<Videos>? videos}) = _$VideoEventImpl;

  factory _VideoEvent.fromJson(Map<String, dynamic> json) =
      _$VideoEventImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  int? get timestamp;
  @override
  CameraDevice? get device;
  @override
  List<String>? get thumbnails;
  @override
  Meta? get meta;
  @override
  List<Videos>? get videos;
  @override
  @JsonKey(ignore: true)
  _$$VideoEventImplCopyWith<_$VideoEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoEventContainer _$VideoEventContainerFromJson(Map<String, dynamic> json) {
  return _VideoEventContainer.fromJson(json);
}

/// @nodoc
mixin _$VideoEventContainer {
  List<VideoEvent>? get videoevents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoEventContainerCopyWith<VideoEventContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoEventContainerCopyWith<$Res> {
  factory $VideoEventContainerCopyWith(
          VideoEventContainer value, $Res Function(VideoEventContainer) then) =
      _$VideoEventContainerCopyWithImpl<$Res, VideoEventContainer>;
  @useResult
  $Res call({List<VideoEvent>? videoevents});
}

/// @nodoc
class _$VideoEventContainerCopyWithImpl<$Res, $Val extends VideoEventContainer>
    implements $VideoEventContainerCopyWith<$Res> {
  _$VideoEventContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoevents = freezed,
  }) {
    return _then(_value.copyWith(
      videoevents: freezed == videoevents
          ? _value.videoevents
          : videoevents // ignore: cast_nullable_to_non_nullable
              as List<VideoEvent>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoEventContainerImplCopyWith<$Res>
    implements $VideoEventContainerCopyWith<$Res> {
  factory _$$VideoEventContainerImplCopyWith(_$VideoEventContainerImpl value,
          $Res Function(_$VideoEventContainerImpl) then) =
      __$$VideoEventContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VideoEvent>? videoevents});
}

/// @nodoc
class __$$VideoEventContainerImplCopyWithImpl<$Res>
    extends _$VideoEventContainerCopyWithImpl<$Res, _$VideoEventContainerImpl>
    implements _$$VideoEventContainerImplCopyWith<$Res> {
  __$$VideoEventContainerImplCopyWithImpl(_$VideoEventContainerImpl _value,
      $Res Function(_$VideoEventContainerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoevents = freezed,
  }) {
    return _then(_$VideoEventContainerImpl(
      videoevents: freezed == videoevents
          ? _value._videoevents
          : videoevents // ignore: cast_nullable_to_non_nullable
              as List<VideoEvent>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoEventContainerImpl implements _VideoEventContainer {
  const _$VideoEventContainerImpl(
      {required final List<VideoEvent>? videoevents})
      : _videoevents = videoevents;

  factory _$VideoEventContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoEventContainerImplFromJson(json);

  final List<VideoEvent>? _videoevents;
  @override
  List<VideoEvent>? get videoevents {
    final value = _videoevents;
    if (value == null) return null;
    if (_videoevents is EqualUnmodifiableListView) return _videoevents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VideoEventContainer(videoevents: $videoevents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoEventContainerImpl &&
            const DeepCollectionEquality()
                .equals(other._videoevents, _videoevents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_videoevents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoEventContainerImplCopyWith<_$VideoEventContainerImpl> get copyWith =>
      __$$VideoEventContainerImplCopyWithImpl<_$VideoEventContainerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoEventContainerImplToJson(
      this,
    );
  }
}

abstract class _VideoEventContainer implements VideoEventContainer {
  const factory _VideoEventContainer(
          {required final List<VideoEvent>? videoevents}) =
      _$VideoEventContainerImpl;

  factory _VideoEventContainer.fromJson(Map<String, dynamic> json) =
      _$VideoEventContainerImpl.fromJson;

  @override
  List<VideoEvent>? get videoevents;
  @override
  @JsonKey(ignore: true)
  _$$VideoEventContainerImplCopyWith<_$VideoEventContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return _Coordinates.fromJson(json);
}

/// @nodoc
mixin _$Coordinates {
  List<List<double>>? get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordinatesCopyWith<Coordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatesCopyWith<$Res> {
  factory $CoordinatesCopyWith(
          Coordinates value, $Res Function(Coordinates) then) =
      _$CoordinatesCopyWithImpl<$Res, Coordinates>;
  @useResult
  $Res call({List<List<double>>? coordinates});
}

/// @nodoc
class _$CoordinatesCopyWithImpl<$Res, $Val extends Coordinates>
    implements $CoordinatesCopyWith<$Res> {
  _$CoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinatesImplCopyWith<$Res>
    implements $CoordinatesCopyWith<$Res> {
  factory _$$CoordinatesImplCopyWith(
          _$CoordinatesImpl value, $Res Function(_$CoordinatesImpl) then) =
      __$$CoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<double>>? coordinates});
}

/// @nodoc
class __$$CoordinatesImplCopyWithImpl<$Res>
    extends _$CoordinatesCopyWithImpl<$Res, _$CoordinatesImpl>
    implements _$$CoordinatesImplCopyWith<$Res> {
  __$$CoordinatesImplCopyWithImpl(
      _$CoordinatesImpl _value, $Res Function(_$CoordinatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
  }) {
    return _then(_$CoordinatesImpl(
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoordinatesImpl implements _Coordinates {
  const _$CoordinatesImpl({required final List<List<double>>? coordinates})
      : _coordinates = coordinates;

  factory _$CoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinatesImplFromJson(json);

  final List<List<double>>? _coordinates;
  @override
  List<List<double>>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Coordinates(coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatesImpl &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatesImplCopyWith<_$CoordinatesImpl> get copyWith =>
      __$$CoordinatesImplCopyWithImpl<_$CoordinatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinatesImplToJson(
      this,
    );
  }
}

abstract class _Coordinates implements Coordinates {
  const factory _Coordinates({required final List<List<double>>? coordinates}) =
      _$CoordinatesImpl;

  factory _Coordinates.fromJson(Map<String, dynamic> json) =
      _$CoordinatesImpl.fromJson;

  @override
  List<List<double>>? get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$CoordinatesImplCopyWith<_$CoordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Layer _$LayerFromJson(Map<String, dynamic> json) {
  return _Layer.fromJson(json);
}

/// @nodoc
mixin _$Layer {
  List<Coordinates>? get objects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LayerCopyWith<Layer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayerCopyWith<$Res> {
  factory $LayerCopyWith(Layer value, $Res Function(Layer) then) =
      _$LayerCopyWithImpl<$Res, Layer>;
  @useResult
  $Res call({List<Coordinates>? objects});
}

/// @nodoc
class _$LayerCopyWithImpl<$Res, $Val extends Layer>
    implements $LayerCopyWith<$Res> {
  _$LayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objects = freezed,
  }) {
    return _then(_value.copyWith(
      objects: freezed == objects
          ? _value.objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LayerImplCopyWith<$Res> implements $LayerCopyWith<$Res> {
  factory _$$LayerImplCopyWith(
          _$LayerImpl value, $Res Function(_$LayerImpl) then) =
      __$$LayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Coordinates>? objects});
}

/// @nodoc
class __$$LayerImplCopyWithImpl<$Res>
    extends _$LayerCopyWithImpl<$Res, _$LayerImpl>
    implements _$$LayerImplCopyWith<$Res> {
  __$$LayerImplCopyWithImpl(
      _$LayerImpl _value, $Res Function(_$LayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objects = freezed,
  }) {
    return _then(_$LayerImpl(
      objects: freezed == objects
          ? _value._objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LayerImpl implements _Layer {
  const _$LayerImpl({required final List<Coordinates>? objects})
      : _objects = objects;

  factory _$LayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LayerImplFromJson(json);

  final List<Coordinates>? _objects;
  @override
  List<Coordinates>? get objects {
    final value = _objects;
    if (value == null) return null;
    if (_objects is EqualUnmodifiableListView) return _objects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Layer(objects: $objects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LayerImpl &&
            const DeepCollectionEquality().equals(other._objects, _objects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_objects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LayerImplCopyWith<_$LayerImpl> get copyWith =>
      __$$LayerImplCopyWithImpl<_$LayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LayerImplToJson(
      this,
    );
  }
}

abstract class _Layer implements Layer {
  const factory _Layer({required final List<Coordinates>? objects}) =
      _$LayerImpl;

  factory _Layer.fromJson(Map<String, dynamic> json) = _$LayerImpl.fromJson;

  @override
  List<Coordinates>? get objects;
  @override
  @JsonKey(ignore: true)
  _$$LayerImplCopyWith<_$LayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
  List<Layer>? get layers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res, Track>;
  @useResult
  $Res call({List<Layer>? layers});
}

/// @nodoc
class _$TrackCopyWithImpl<$Res, $Val extends Track>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layers = freezed,
  }) {
    return _then(_value.copyWith(
      layers: freezed == layers
          ? _value.layers
          : layers // ignore: cast_nullable_to_non_nullable
              as List<Layer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackImplCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$$TrackImplCopyWith(
          _$TrackImpl value, $Res Function(_$TrackImpl) then) =
      __$$TrackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Layer>? layers});
}

/// @nodoc
class __$$TrackImplCopyWithImpl<$Res>
    extends _$TrackCopyWithImpl<$Res, _$TrackImpl>
    implements _$$TrackImplCopyWith<$Res> {
  __$$TrackImplCopyWithImpl(
      _$TrackImpl _value, $Res Function(_$TrackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layers = freezed,
  }) {
    return _then(_$TrackImpl(
      layers: freezed == layers
          ? _value._layers
          : layers // ignore: cast_nullable_to_non_nullable
              as List<Layer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackImpl implements _Track {
  const _$TrackImpl({required final List<Layer>? layers}) : _layers = layers;

  factory _$TrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackImplFromJson(json);

  final List<Layer>? _layers;
  @override
  List<Layer>? get layers {
    final value = _layers;
    if (value == null) return null;
    if (_layers is EqualUnmodifiableListView) return _layers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Track(layers: $layers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackImpl &&
            const DeepCollectionEquality().equals(other._layers, _layers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_layers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      __$$TrackImplCopyWithImpl<_$TrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackImplToJson(
      this,
    );
  }
}

abstract class _Track implements Track {
  const factory _Track({required final List<Layer>? layers}) = _$TrackImpl;

  factory _Track.fromJson(Map<String, dynamic> json) = _$TrackImpl.fromJson;

  @override
  List<Layer>? get layers;
  @override
  @JsonKey(ignore: true)
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
