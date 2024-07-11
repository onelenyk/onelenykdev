// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tap _$TapFromJson(Map<String, dynamic> json) {
  return _Tap.fromJson(json);
}

/// @nodoc
mixin _$Tap {
  String get id => throw _privateConstructorUsedError;
  @TimestampSerializer2()
  Timestamp get tapDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TapCopyWith<Tap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TapCopyWith<$Res> {
  factory $TapCopyWith(Tap value, $Res Function(Tap) then) =
      _$TapCopyWithImpl<$Res, Tap>;
  @useResult
  $Res call({String id, @TimestampSerializer2() Timestamp tapDate});
}

/// @nodoc
class _$TapCopyWithImpl<$Res, $Val extends Tap> implements $TapCopyWith<$Res> {
  _$TapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tapDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tapDate: null == tapDate
          ? _value.tapDate
          : tapDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TapImplCopyWith<$Res> implements $TapCopyWith<$Res> {
  factory _$$TapImplCopyWith(_$TapImpl value, $Res Function(_$TapImpl) then) =
      __$$TapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, @TimestampSerializer2() Timestamp tapDate});
}

/// @nodoc
class __$$TapImplCopyWithImpl<$Res> extends _$TapCopyWithImpl<$Res, _$TapImpl>
    implements _$$TapImplCopyWith<$Res> {
  __$$TapImplCopyWithImpl(_$TapImpl _value, $Res Function(_$TapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tapDate = null,
  }) {
    return _then(_$TapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tapDate: null == tapDate
          ? _value.tapDate
          : tapDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TapImpl extends _Tap {
  _$TapImpl({required this.id, @TimestampSerializer2() required this.tapDate})
      : super._();

  factory _$TapImpl.fromJson(Map<String, dynamic> json) =>
      _$$TapImplFromJson(json);

  @override
  final String id;
  @override
  @TimestampSerializer2()
  final Timestamp tapDate;

  @override
  String toString() {
    return 'Tap(id: $id, tapDate: $tapDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tapDate, tapDate) || other.tapDate == tapDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tapDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TapImplCopyWith<_$TapImpl> get copyWith =>
      __$$TapImplCopyWithImpl<_$TapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TapImplToJson(
      this,
    );
  }
}

abstract class _Tap extends Tap {
  factory _Tap(
      {required final String id,
      @TimestampSerializer2() required final Timestamp tapDate}) = _$TapImpl;
  _Tap._() : super._();

  factory _Tap.fromJson(Map<String, dynamic> json) = _$TapImpl.fromJson;

  @override
  String get id;
  @override
  @TimestampSerializer2()
  Timestamp get tapDate;
  @override
  @JsonKey(ignore: true)
  _$$TapImplCopyWith<_$TapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPayload _$UserPayloadFromJson(Map<String, dynamic> json) {
  return _UserPayload.fromJson(json);
}

/// @nodoc
mixin _$UserPayload {
  String? get id => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  List<Tap> get taps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPayloadCopyWith<UserPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPayloadCopyWith<$Res> {
  factory $UserPayloadCopyWith(
          UserPayload value, $Res Function(UserPayload) then) =
      _$UserPayloadCopyWithImpl<$Res, UserPayload>;
  @useResult
  $Res call({String? id, String? uid, List<Tap> taps});
}

/// @nodoc
class _$UserPayloadCopyWithImpl<$Res, $Val extends UserPayload>
    implements $UserPayloadCopyWith<$Res> {
  _$UserPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? taps = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      taps: null == taps
          ? _value.taps
          : taps // ignore: cast_nullable_to_non_nullable
              as List<Tap>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPayloadImplCopyWith<$Res>
    implements $UserPayloadCopyWith<$Res> {
  factory _$$UserPayloadImplCopyWith(
          _$UserPayloadImpl value, $Res Function(_$UserPayloadImpl) then) =
      __$$UserPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? uid, List<Tap> taps});
}

/// @nodoc
class __$$UserPayloadImplCopyWithImpl<$Res>
    extends _$UserPayloadCopyWithImpl<$Res, _$UserPayloadImpl>
    implements _$$UserPayloadImplCopyWith<$Res> {
  __$$UserPayloadImplCopyWithImpl(
      _$UserPayloadImpl _value, $Res Function(_$UserPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? taps = null,
  }) {
    return _then(_$UserPayloadImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      taps: null == taps
          ? _value._taps
          : taps // ignore: cast_nullable_to_non_nullable
              as List<Tap>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPayloadImpl extends _UserPayload {
  _$UserPayloadImpl(
      {required this.id, required this.uid, required final List<Tap> taps})
      : _taps = taps,
        super._();

  factory _$UserPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPayloadImplFromJson(json);

  @override
  final String? id;
  @override
  final String? uid;
  final List<Tap> _taps;
  @override
  List<Tap> get taps {
    if (_taps is EqualUnmodifiableListView) return _taps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taps);
  }

  @override
  String toString() {
    return 'UserPayload(id: $id, uid: $uid, taps: $taps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPayloadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality().equals(other._taps, _taps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, uid, const DeepCollectionEquality().hash(_taps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPayloadImplCopyWith<_$UserPayloadImpl> get copyWith =>
      __$$UserPayloadImplCopyWithImpl<_$UserPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPayloadImplToJson(
      this,
    );
  }
}

abstract class _UserPayload extends UserPayload {
  factory _UserPayload(
      {required final String? id,
      required final String? uid,
      required final List<Tap> taps}) = _$UserPayloadImpl;
  _UserPayload._() : super._();

  factory _UserPayload.fromJson(Map<String, dynamic> json) =
      _$UserPayloadImpl.fromJson;

  @override
  String? get id;
  @override
  String? get uid;
  @override
  List<Tap> get taps;
  @override
  @JsonKey(ignore: true)
  _$$UserPayloadImplCopyWith<_$UserPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
