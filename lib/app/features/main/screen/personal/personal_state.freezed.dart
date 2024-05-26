// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PersonalState {
  ScenarioState get activeScenario => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalStateCopyWith<PersonalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalStateCopyWith<$Res> {
  factory $PersonalStateCopyWith(
          PersonalState value, $Res Function(PersonalState) then) =
      _$PersonalStateCopyWithImpl<$Res, PersonalState>;
  @useResult
  $Res call({ScenarioState activeScenario, bool isLoading});

  $ScenarioStateCopyWith<$Res> get activeScenario;
}

/// @nodoc
class _$PersonalStateCopyWithImpl<$Res, $Val extends PersonalState>
    implements $PersonalStateCopyWith<$Res> {
  _$PersonalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeScenario = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      activeScenario: null == activeScenario
          ? _value.activeScenario
          : activeScenario // ignore: cast_nullable_to_non_nullable
              as ScenarioState,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScenarioStateCopyWith<$Res> get activeScenario {
    return $ScenarioStateCopyWith<$Res>(_value.activeScenario, (value) {
      return _then(_value.copyWith(activeScenario: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonalStateImplCopyWith<$Res>
    implements $PersonalStateCopyWith<$Res> {
  factory _$$PersonalStateImplCopyWith(
          _$PersonalStateImpl value, $Res Function(_$PersonalStateImpl) then) =
      __$$PersonalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScenarioState activeScenario, bool isLoading});

  @override
  $ScenarioStateCopyWith<$Res> get activeScenario;
}

/// @nodoc
class __$$PersonalStateImplCopyWithImpl<$Res>
    extends _$PersonalStateCopyWithImpl<$Res, _$PersonalStateImpl>
    implements _$$PersonalStateImplCopyWith<$Res> {
  __$$PersonalStateImplCopyWithImpl(
      _$PersonalStateImpl _value, $Res Function(_$PersonalStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeScenario = null,
    Object? isLoading = null,
  }) {
    return _then(_$PersonalStateImpl(
      activeScenario: null == activeScenario
          ? _value.activeScenario
          : activeScenario // ignore: cast_nullable_to_non_nullable
              as ScenarioState,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PersonalStateImpl extends _PersonalState {
  _$PersonalStateImpl({required this.activeScenario, required this.isLoading})
      : super._();

  @override
  final ScenarioState activeScenario;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PersonalState(activeScenario: $activeScenario, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalStateImpl &&
            (identical(other.activeScenario, activeScenario) ||
                other.activeScenario == activeScenario) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeScenario, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalStateImplCopyWith<_$PersonalStateImpl> get copyWith =>
      __$$PersonalStateImplCopyWithImpl<_$PersonalStateImpl>(this, _$identity);
}

abstract class _PersonalState extends PersonalState {
  factory _PersonalState(
      {required final ScenarioState activeScenario,
      required final bool isLoading}) = _$PersonalStateImpl;
  _PersonalState._() : super._();

  @override
  ScenarioState get activeScenario;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$PersonalStateImplCopyWith<_$PersonalStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
