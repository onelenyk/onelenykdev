// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loginOpened) authInitial,
    required TResult Function(User? user) authSuccess,
    required TResult Function(String? error) authFailed,
    required TResult Function() authLoading,
    required TResult Function() authSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loginOpened)? authInitial,
    TResult? Function(User? user)? authSuccess,
    TResult? Function(String? error)? authFailed,
    TResult? Function()? authLoading,
    TResult? Function()? authSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loginOpened)? authInitial,
    TResult Function(User? user)? authSuccess,
    TResult Function(String? error)? authFailed,
    TResult Function()? authLoading,
    TResult Function()? authSignedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) authInitial,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailed value) authFailed,
    required TResult Function(AuthLoading value) authLoading,
    required TResult Function(AuthSignedOut value) authSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? authInitial,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailed value)? authFailed,
    TResult? Function(AuthLoading value)? authLoading,
    TResult? Function(AuthSignedOut value)? authSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? authInitial,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailed value)? authFailed,
    TResult Function(AuthLoading value)? authLoading,
    TResult Function(AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
          _$AuthInitialImpl value, $Res Function(_$AuthInitialImpl) then) =
      __$$AuthInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loginOpened});
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
      _$AuthInitialImpl _value, $Res Function(_$AuthInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginOpened = null,
  }) {
    return _then(_$AuthInitialImpl(
      null == loginOpened
          ? _value.loginOpened
          : loginOpened // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthInitialImpl extends AuthInitial {
  _$AuthInitialImpl(this.loginOpened) : super._();

  @override
  final bool loginOpened;

  @override
  String toString() {
    return 'AuthState.authInitial(loginOpened: $loginOpened)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthInitialImpl &&
            (identical(other.loginOpened, loginOpened) ||
                other.loginOpened == loginOpened));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginOpened);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthInitialImplCopyWith<_$AuthInitialImpl> get copyWith =>
      __$$AuthInitialImplCopyWithImpl<_$AuthInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loginOpened) authInitial,
    required TResult Function(User? user) authSuccess,
    required TResult Function(String? error) authFailed,
    required TResult Function() authLoading,
    required TResult Function() authSignedOut,
  }) {
    return authInitial(loginOpened);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loginOpened)? authInitial,
    TResult? Function(User? user)? authSuccess,
    TResult? Function(String? error)? authFailed,
    TResult? Function()? authLoading,
    TResult? Function()? authSignedOut,
  }) {
    return authInitial?.call(loginOpened);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loginOpened)? authInitial,
    TResult Function(User? user)? authSuccess,
    TResult Function(String? error)? authFailed,
    TResult Function()? authLoading,
    TResult Function()? authSignedOut,
    required TResult orElse(),
  }) {
    if (authInitial != null) {
      return authInitial(loginOpened);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) authInitial,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailed value) authFailed,
    required TResult Function(AuthLoading value) authLoading,
    required TResult Function(AuthSignedOut value) authSignedOut,
  }) {
    return authInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? authInitial,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailed value)? authFailed,
    TResult? Function(AuthLoading value)? authLoading,
    TResult? Function(AuthSignedOut value)? authSignedOut,
  }) {
    return authInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? authInitial,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailed value)? authFailed,
    TResult Function(AuthLoading value)? authLoading,
    TResult Function(AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authInitial != null) {
      return authInitial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial extends AuthState {
  factory AuthInitial(final bool loginOpened) = _$AuthInitialImpl;
  AuthInitial._() : super._();

  bool get loginOpened;
  @JsonKey(ignore: true)
  _$$AuthInitialImplCopyWith<_$AuthInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<$Res> {
  factory _$$AuthSuccessImplCopyWith(
          _$AuthSuccessImpl value, $Res Function(_$AuthSuccessImpl) then) =
      __$$AuthSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSuccessImpl>
    implements _$$AuthSuccessImplCopyWith<$Res> {
  __$$AuthSuccessImplCopyWithImpl(
      _$AuthSuccessImpl _value, $Res Function(_$AuthSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AuthSuccessImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$AuthSuccessImpl extends AuthSuccess {
  _$AuthSuccessImpl(this.user) : super._();

  @override
  final User? user;

  @override
  String toString() {
    return 'AuthState.authSuccess(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      __$$AuthSuccessImplCopyWithImpl<_$AuthSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loginOpened) authInitial,
    required TResult Function(User? user) authSuccess,
    required TResult Function(String? error) authFailed,
    required TResult Function() authLoading,
    required TResult Function() authSignedOut,
  }) {
    return authSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loginOpened)? authInitial,
    TResult? Function(User? user)? authSuccess,
    TResult? Function(String? error)? authFailed,
    TResult? Function()? authLoading,
    TResult? Function()? authSignedOut,
  }) {
    return authSuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loginOpened)? authInitial,
    TResult Function(User? user)? authSuccess,
    TResult Function(String? error)? authFailed,
    TResult Function()? authLoading,
    TResult Function()? authSignedOut,
    required TResult orElse(),
  }) {
    if (authSuccess != null) {
      return authSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) authInitial,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailed value) authFailed,
    required TResult Function(AuthLoading value) authLoading,
    required TResult Function(AuthSignedOut value) authSignedOut,
  }) {
    return authSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? authInitial,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailed value)? authFailed,
    TResult? Function(AuthLoading value)? authLoading,
    TResult? Function(AuthSignedOut value)? authSignedOut,
  }) {
    return authSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? authInitial,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailed value)? authFailed,
    TResult Function(AuthLoading value)? authLoading,
    TResult Function(AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authSuccess != null) {
      return authSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthSuccess extends AuthState {
  factory AuthSuccess(final User? user) = _$AuthSuccessImpl;
  AuthSuccess._() : super._();

  User? get user;
  @JsonKey(ignore: true)
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailedImplCopyWith<$Res> {
  factory _$$AuthFailedImplCopyWith(
          _$AuthFailedImpl value, $Res Function(_$AuthFailedImpl) then) =
      __$$AuthFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$AuthFailedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthFailedImpl>
    implements _$$AuthFailedImplCopyWith<$Res> {
  __$$AuthFailedImplCopyWithImpl(
      _$AuthFailedImpl _value, $Res Function(_$AuthFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AuthFailedImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthFailedImpl extends AuthFailed {
  _$AuthFailedImpl(this.error) : super._();

  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState.authFailed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailedImplCopyWith<_$AuthFailedImpl> get copyWith =>
      __$$AuthFailedImplCopyWithImpl<_$AuthFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loginOpened) authInitial,
    required TResult Function(User? user) authSuccess,
    required TResult Function(String? error) authFailed,
    required TResult Function() authLoading,
    required TResult Function() authSignedOut,
  }) {
    return authFailed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loginOpened)? authInitial,
    TResult? Function(User? user)? authSuccess,
    TResult? Function(String? error)? authFailed,
    TResult? Function()? authLoading,
    TResult? Function()? authSignedOut,
  }) {
    return authFailed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loginOpened)? authInitial,
    TResult Function(User? user)? authSuccess,
    TResult Function(String? error)? authFailed,
    TResult Function()? authLoading,
    TResult Function()? authSignedOut,
    required TResult orElse(),
  }) {
    if (authFailed != null) {
      return authFailed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) authInitial,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailed value) authFailed,
    required TResult Function(AuthLoading value) authLoading,
    required TResult Function(AuthSignedOut value) authSignedOut,
  }) {
    return authFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? authInitial,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailed value)? authFailed,
    TResult? Function(AuthLoading value)? authLoading,
    TResult? Function(AuthSignedOut value)? authSignedOut,
  }) {
    return authFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? authInitial,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailed value)? authFailed,
    TResult Function(AuthLoading value)? authLoading,
    TResult Function(AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authFailed != null) {
      return authFailed(this);
    }
    return orElse();
  }
}

abstract class AuthFailed extends AuthState {
  factory AuthFailed(final String? error) = _$AuthFailedImpl;
  AuthFailed._() : super._();

  String? get error;
  @JsonKey(ignore: true)
  _$$AuthFailedImplCopyWith<_$AuthFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
          _$AuthLoadingImpl value, $Res Function(_$AuthLoadingImpl) then) =
      __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl _value, $Res Function(_$AuthLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoadingImpl extends AuthLoading {
  _$AuthLoadingImpl() : super._();

  @override
  String toString() {
    return 'AuthState.authLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loginOpened) authInitial,
    required TResult Function(User? user) authSuccess,
    required TResult Function(String? error) authFailed,
    required TResult Function() authLoading,
    required TResult Function() authSignedOut,
  }) {
    return authLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loginOpened)? authInitial,
    TResult? Function(User? user)? authSuccess,
    TResult? Function(String? error)? authFailed,
    TResult? Function()? authLoading,
    TResult? Function()? authSignedOut,
  }) {
    return authLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loginOpened)? authInitial,
    TResult Function(User? user)? authSuccess,
    TResult Function(String? error)? authFailed,
    TResult Function()? authLoading,
    TResult Function()? authSignedOut,
    required TResult orElse(),
  }) {
    if (authLoading != null) {
      return authLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) authInitial,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailed value) authFailed,
    required TResult Function(AuthLoading value) authLoading,
    required TResult Function(AuthSignedOut value) authSignedOut,
  }) {
    return authLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? authInitial,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailed value)? authFailed,
    TResult? Function(AuthLoading value)? authLoading,
    TResult? Function(AuthSignedOut value)? authSignedOut,
  }) {
    return authLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? authInitial,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailed value)? authFailed,
    TResult Function(AuthLoading value)? authLoading,
    TResult Function(AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authLoading != null) {
      return authLoading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading extends AuthState {
  factory AuthLoading() = _$AuthLoadingImpl;
  AuthLoading._() : super._();
}

/// @nodoc
abstract class _$$AuthSignedOutImplCopyWith<$Res> {
  factory _$$AuthSignedOutImplCopyWith(
          _$AuthSignedOutImpl value, $Res Function(_$AuthSignedOutImpl) then) =
      __$$AuthSignedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSignedOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSignedOutImpl>
    implements _$$AuthSignedOutImplCopyWith<$Res> {
  __$$AuthSignedOutImplCopyWithImpl(
      _$AuthSignedOutImpl _value, $Res Function(_$AuthSignedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthSignedOutImpl extends AuthSignedOut {
  _$AuthSignedOutImpl() : super._();

  @override
  String toString() {
    return 'AuthState.authSignedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthSignedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loginOpened) authInitial,
    required TResult Function(User? user) authSuccess,
    required TResult Function(String? error) authFailed,
    required TResult Function() authLoading,
    required TResult Function() authSignedOut,
  }) {
    return authSignedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loginOpened)? authInitial,
    TResult? Function(User? user)? authSuccess,
    TResult? Function(String? error)? authFailed,
    TResult? Function()? authLoading,
    TResult? Function()? authSignedOut,
  }) {
    return authSignedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loginOpened)? authInitial,
    TResult Function(User? user)? authSuccess,
    TResult Function(String? error)? authFailed,
    TResult Function()? authLoading,
    TResult Function()? authSignedOut,
    required TResult orElse(),
  }) {
    if (authSignedOut != null) {
      return authSignedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) authInitial,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailed value) authFailed,
    required TResult Function(AuthLoading value) authLoading,
    required TResult Function(AuthSignedOut value) authSignedOut,
  }) {
    return authSignedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? authInitial,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailed value)? authFailed,
    TResult? Function(AuthLoading value)? authLoading,
    TResult? Function(AuthSignedOut value)? authSignedOut,
  }) {
    return authSignedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? authInitial,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailed value)? authFailed,
    TResult Function(AuthLoading value)? authLoading,
    TResult Function(AuthSignedOut value)? authSignedOut,
    required TResult orElse(),
  }) {
    if (authSignedOut != null) {
      return authSignedOut(this);
    }
    return orElse();
  }
}

abstract class AuthSignedOut extends AuthState {
  factory AuthSignedOut() = _$AuthSignedOutImpl;
  AuthSignedOut._() : super._();
}
