
abstract class SignInState {}

class SignInInitState extends SignInState{}

class SignInInvalidState extends SignInState{}

class SignInValidState extends SignInState{}

class SignInErrorState extends SignInState {
  final String errorMsg;
  SignInErrorState(this.errorMsg);
}

class SingInLoadingState extends SignInState {}