import 'package:bloc_app/sign_in/bloc/sigin_state.dart';
import 'package:bloc_app/sign_in/bloc/signin_event.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInevent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState('Please enter a valid email address'));
      } else if (event.PasswordValue.length < 8) {
        emit(SignInErrorState('Please enter valid Password'));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignIntextSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
