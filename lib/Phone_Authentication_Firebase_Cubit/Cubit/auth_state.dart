import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState{}


class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthCodeSendState extends AuthState {}

class AuthCodeVerifiedState extends AuthState {}

class AuthLogInState extends AuthState {
 final User firebaseUser;
 AuthLogInState(this.firebaseUser);
}

class AuthLogOutState extends AuthState {}

class AuthErrorState extends AuthState {
 final String error;
  AuthErrorState(this.error);
}