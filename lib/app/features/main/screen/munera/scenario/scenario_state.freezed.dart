// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScenarioState {
  User? get user => throw _privateConstructorUsedError;
  UserPayload? get payload => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScenarioStateCopyWith<ScenarioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioStateCopyWith<$Res> {
  factory $ScenarioStateCopyWith(
          ScenarioState value, $Res Function(ScenarioState) then) =
      _$ScenarioStateCopyWithImpl<$Res, ScenarioState>;
  @useResult
  $Res call({User? user, UserPayload? payload});

  $UserPayloadCopyWith<$Res>? get payload;
}

/// @nodoc
class _$ScenarioStateCopyWithImpl<$Res, $Val extends ScenarioState>
    implements $ScenarioStateCopyWith<$Res> {
  _$ScenarioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as UserPayload?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPayloadCopyWith<$Res>? get payload {
    if (_value.payload == null) {
      return null;
    }

    return $UserPayloadCopyWith<$Res>(_value.payload!, (value) {
      return _then(_value.copyWith(payload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScenarioStateImplCopyWith<$Res>
    implements $ScenarioStateCopyWith<$Res> {
  factory _$$ScenarioStateImplCopyWith(
          _$ScenarioStateImpl value, $Res Function(_$ScenarioStateImpl) then) =
      __$$ScenarioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, UserPayload? payload});

  @override
  $UserPayloadCopyWith<$Res>? get payload;
}

/// @nodoc
class __$$ScenarioStateImplCopyWithImpl<$Res>
    extends _$ScenarioStateCopyWithImpl<$Res, _$ScenarioStateImpl>
    implements _$$ScenarioStateImplCopyWith<$Res> {
  __$$ScenarioStateImplCopyWithImpl(
      _$ScenarioStateImpl _value, $Res Function(_$ScenarioStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? payload = freezed,
  }) {
    return _then(_$ScenarioStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as UserPayload?,
    ));
  }
}

/// @nodoc

class _$ScenarioStateImpl extends _ScenarioState {
  _$ScenarioStateImpl({required this.user, required this.payload}) : super._();

  @override
  final User? user;
  @override
  final UserPayload? payload;

  @override
  String toString() {
    return 'ScenarioState(user: $user, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScenarioStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, payload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioStateImplCopyWith<_$ScenarioStateImpl> get copyWith =>
      __$$ScenarioStateImplCopyWithImpl<_$ScenarioStateImpl>(this, _$identity);
}

abstract class _ScenarioState extends ScenarioState {
  factory _ScenarioState(
      {required final User? user,
      required final UserPayload? payload}) = _$ScenarioStateImpl;
  _ScenarioState._() : super._();

  @override
  User? get user;
  @override
  UserPayload? get payload;
  @override
  @JsonKey(ignore: true)
  _$$ScenarioStateImplCopyWith<_$ScenarioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
