import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _firebaseAuth;
  StreamSubscription<User?>? _authStateSubscription;

  AuthenticationCubit(this._firebaseAuth) : super(AuthenticationInitial()) {
    init();
  }

  void startPeriodicAction(Duration interval, Function action) {
    Timer.periodic(interval, (Timer timer) {
      action();

      // If you need to stop the timer under certain conditions,
      // you can call timer.cancel();
    });
  }

  void init() {
/*    startPeriodicAction(Duration(seconds: 1), () {
      emit(AuthenticationLoading());

    });*/
    _authStateSubscription = _firebaseAuth.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('User is currently signed out!');
          emit(AuthenticationInitial());
        } else {
          print('User is signed in!');
          emit(AuthenticationSuccess(user));
        }
      },
      onError: (error) {
        print('Error listening to auth state changes: $error');
        emit(AuthenticationFailure(error.toString()));
      },
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    emit(AuthenticationInitial()); // Emitting initial state after sign out
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      emit(AuthenticationLoading());
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthenticationSuccess(userCredential.user));
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(AuthenticationFailure(e.message));
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
