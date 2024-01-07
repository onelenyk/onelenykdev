// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainState {
  Routes get activeRoute => throw _privateConstructorUsedError;
  bool get isMenuOpened => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call({Routes activeRoute, bool isMenuOpened});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeRoute = null,
    Object? isMenuOpened = null,
  }) {
    return _then(_value.copyWith(
      activeRoute: null == activeRoute
          ? _value.activeRoute
          : activeRoute // ignore: cast_nullable_to_non_nullable
              as Routes,
      isMenuOpened: null == isMenuOpened
          ? _value.isMenuOpened
          : isMenuOpened // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Routes activeRoute, bool isMenuOpened});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeRoute = null,
    Object? isMenuOpened = null,
  }) {
    return _then(_$MainStateImpl(
      activeRoute: null == activeRoute
          ? _value.activeRoute
          : activeRoute // ignore: cast_nullable_to_non_nullable
              as Routes,
      isMenuOpened: null == isMenuOpened
          ? _value.isMenuOpened
          : isMenuOpened // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MainStateImpl extends _MainState {
  _$MainStateImpl({required this.activeRoute, required this.isMenuOpened})
      : super._();

  @override
  final Routes activeRoute;
  @override
  final bool isMenuOpened;

  @override
  String toString() {
    return 'MainState(activeRoute: $activeRoute, isMenuOpened: $isMenuOpened)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.activeRoute, activeRoute) ||
                other.activeRoute == activeRoute) &&
            (identical(other.isMenuOpened, isMenuOpened) ||
                other.isMenuOpened == isMenuOpened));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeRoute, isMenuOpened);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState extends MainState {
  factory _MainState(
      {required final Routes activeRoute,
      required final bool isMenuOpened}) = _$MainStateImpl;
  _MainState._() : super._();

  @override
  Routes get activeRoute;
  @override
  bool get isMenuOpened;
  @override
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
