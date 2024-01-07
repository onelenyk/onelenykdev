import "package:equatable/equatable.dart";
import "package:firebase_auth/firebase_auth.dart";

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {

  const AuthenticationSuccess(this.user);
  final User? user;

  @override
  List<Object> get props => [user!];
}

class AuthenticationFailure extends AuthenticationState {

  const AuthenticationFailure(this.error);
  final String? error;

  @override
  List<Object> get props => [error!];
}
