import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Form_Validation_BLoC/bloc/SignInEvent.dart';
import 'package:form_validation_bloc/Form_Validation_BLoC/bloc/SignInState.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitState()) {
    on<SignInTextChangeEvent>((event, emit) => {
          if (EmailValidator.validate(event.emailValue)==false)
            {emit(SignInErrorState("Please enter valid email address"))}
          else if (event.passwordValue.length <= 7)
            {emit(SignInErrorState("Please enter 8 char password"))}
          else
            {emit(SignInValidState())}
        });

    on<SignInSubmitedEvent>((event, emit) => emit(SingInLoadingState()));
  }
}
