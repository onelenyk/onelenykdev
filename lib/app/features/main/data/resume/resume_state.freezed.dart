// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResumeState {
  ProfileItem get profile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResumeStateCopyWith<ResumeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResumeStateCopyWith<$Res> {
  factory $ResumeStateCopyWith(
          ResumeState value, $Res Function(ResumeState) then) =
      _$ResumeStateCopyWithImpl<$Res, ResumeState>;
  @useResult
  $Res call({ProfileItem profile});

  $ProfileItemCopyWith<$Res> get profile;
}

/// @nodoc
class _$ResumeStateCopyWithImpl<$Res, $Val extends ResumeState>
    implements $ResumeStateCopyWith<$Res> {
  _$ResumeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileItemCopyWith<$Res> get profile {
    return $ProfileItemCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResumeStateImplCopyWith<$Res>
    implements $ResumeStateCopyWith<$Res> {
  factory _$$ResumeStateImplCopyWith(
          _$ResumeStateImpl value, $Res Function(_$ResumeStateImpl) then) =
      __$$ResumeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileItem profile});

  @override
  $ProfileItemCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ResumeStateImplCopyWithImpl<$Res>
    extends _$ResumeStateCopyWithImpl<$Res, _$ResumeStateImpl>
    implements _$$ResumeStateImplCopyWith<$Res> {
  __$$ResumeStateImplCopyWithImpl(
      _$ResumeStateImpl _value, $Res Function(_$ResumeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$ResumeStateImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileItem,
    ));
  }
}

/// @nodoc

class _$ResumeStateImpl extends _ResumeState {
  _$ResumeStateImpl({required this.profile}) : super._();

  @override
  final ProfileItem profile;

  @override
  String toString() {
    return 'ResumeState(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeStateImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeStateImplCopyWith<_$ResumeStateImpl> get copyWith =>
      __$$ResumeStateImplCopyWithImpl<_$ResumeStateImpl>(this, _$identity);
}

abstract class _ResumeState extends ResumeState {
  factory _ResumeState({required final ProfileItem profile}) =
      _$ResumeStateImpl;
  _ResumeState._() : super._();

  @override
  ProfileItem get profile;
  @override
  @JsonKey(ignore: true)
  _$$ResumeStateImplCopyWith<_$ResumeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
