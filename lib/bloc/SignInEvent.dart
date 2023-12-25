
abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent{
  final String emailValue;
  final String passwordValue;
  SignInTextChangeEvent(this.emailValue,this.passwordValue);
}

class SignInSubmitedEvent extends SignInEvent{
  final String email;
  final String password;
  SignInSubmitedEvent(this.email,this.password);
}