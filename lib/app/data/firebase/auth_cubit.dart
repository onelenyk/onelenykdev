import "dart:async";

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:onelenykco/app/data/firebase/authentication_state.dart";

import "../repository/user_payload_repository.dart";
import "../repository/user_repository.dart";
import "auth/auth_state.dart";

class AuthenticationCubit extends Cubit<AuthState> {
  AuthenticationCubit(this._firebaseAuth)
      : super(const AuthState.authInitial(false)) {
    init();
  }

  final getIt = GetIt.instance;
  late final UserPayloadRepository userRepository = getIt<UserPayloadRepository>();

  final FirebaseAuth _firebaseAuth;
  StreamSubscription<User?>? _authStateSubscription;

  void init() {
    _authStateSubscription = _firebaseAuth.authStateChanges().listen(
      (final user) {
        if (user == null) {
          print("User is currently signed out!");
          emit(AuthState.authInitial(false));
        } else {
          print("User is signed in!");
          emit(AuthState.authSuccess(user));
        }
      },
      onError: (final error) {
        print("Error listening to auth state changes: $error");
        emit(AuthState.authFailed(error.toString()));
      },
    );
  }

  Future<void> switchLogin() async {
    if (state is AuthInitial) {
      final authState = state as AuthInitial;
      emit(
        authState.copyWith(
          loginOpened: !authState.loginOpened,
        ),
      );
    } else {
      emit(AuthInitial(true));
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    emit(const AuthState.authInitial(
        false)); // Emitting initial state after sign out
  }

  Future<void> signInOrRegisterWithEmailAndPassword(
      final String email, final String password) async {
    emit(const AuthState.authLoading());
    try {
      final userCredential = await _attemptSignIn(email, password);
      final userPayload = await userRepository
          .findOrCreateUserPayloadByUID(userCredential.user!.uid);
      emit(AuthState.authSuccess(userCredential.user));
    } catch (e) {
      emit(AuthState.authFailed(_processSignInError(e)));
    }
  }

  String _processSignInError(final error) {
    if (error is FirebaseAuthException) {
      return _handleFirebaseAuthException(error);
    }
    return "Unexpected error: ${error.toString()}";
  }

  String _handleFirebaseAuthException(final FirebaseAuthException exception) {
    final code = exception.code;
    return _handleRegistrationError(code);
  }

  String _handleRegistrationError(final String? code) {
    switch (code) {
      case "email-already-in-use":
        return "The email address is already in use by another account.";
      case "invalid-email":
        return "The email address is not valid.";
      case "operation-not-allowed":
        return "Email/password accounts are not enabled.";
      case "weak-password":
        return "The password is too weak.";
      default:
        return _errorCodeToMessage(code);
    }
  }

  String _errorCodeToMessage(final String? code) {
    switch (code) {
      case "invalid-email":
        return "Invalid email";
      case "user-not-found":
        return "User not found. Please register.";
      case "wrong-password":
        return "Invalid password. Please try again.";
      case "weak-password":
        return "The password is too weak.";
      case null:
        return "Unknown error";
      default:
        return "Unexpected error: $code";
    }
  }

  Future<UserCredential> _attemptSignIn(
      final String email, final String password) async {
    try {
      return await _signIn(email, password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return _register(email, password);
      }
      throw e;
    }
  }

  Future<UserCredential> _signIn(
      final String email, final String password) async =>
      _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<UserCredential> _register(
      final String email, final String password) async =>
      _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
