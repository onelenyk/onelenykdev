import "dart:async";

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:onelenykco/app/data/firebase/authentication_state.dart";

import "auth/auth_state.dart";

class AuthenticationCubit extends Cubit<AuthState> {
  AuthenticationCubit(this._firebaseAuth)
      : super(const AuthState.authInitial(false)) {
    init();
  }

  final FirebaseAuth _firebaseAuth;
  StreamSubscription<User?>? _authStateSubscription;

  void startPeriodicAction(final Duration interval, final Function action) {
    Timer.periodic(interval, (final timer) {
      action();

      // If you need to stop the timer under certain conditions,
      // you can call timer.cancel();
    });
  }

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
      var authState = state as AuthInitial;
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
    emit(AuthState.authInitial(false)); // Emitting initial state after sign out
  }

  Future<void> signInWithEmailAndPassword(
      final String email, final String password) async {
    try {
      emit(AuthState.authLoading());
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthState.authSuccess(userCredential.user));
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(AuthState.authFailed(e.message));
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
