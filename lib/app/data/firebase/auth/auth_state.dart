import "package:firebase_auth/firebase_auth.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.authInitial(final bool loginOpened) = AuthInitial;
  const factory AuthState.authSuccess(final User? user) = AuthSuccess;
  const factory AuthState.authFailed(final String? error) = AuthFailed;
  const factory AuthState.authLoading() = AuthLoading;
}
