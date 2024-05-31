import "package:firebase_auth/firebase_auth.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  AuthState._();
  factory AuthState.authInitial(final bool loginOpened) = AuthInitial;

  factory AuthState.authSuccess(final User? user) = AuthSuccess;

  factory AuthState.authFailed(final String? error) = AuthFailed;

  factory AuthState.authLoading() = AuthLoading;

  factory AuthState.authSignedOut() = AuthSignedOut;

  String get login => getLogin();

  String getLogin() {
    var email = "";
    if (this is AuthSuccess) {
      email = (this as AuthSuccess).user?.email ?? "";
    } else {
      email = "";
    }
    return getLocalPartOfEmail(email);
  }

  String getLocalPartOfEmail(final String email) {
    // Check if the email contains '@' symbol
    if (email.contains('@')) {
      // Split the email by '@' and return the first part
      return email.split('@')[0];
    } else {
      // If email does not contain '@', return an empty string or handle as needed
      return '';
    }
  }
}
