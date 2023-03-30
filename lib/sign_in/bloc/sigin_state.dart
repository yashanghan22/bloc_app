import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {}

class SignInInitialState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInValidState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInErrorState extends SignInState {
  final String errormessage;
  SignInErrorState(this.errormessage);

  @override
  List<Object?> get props => [this.errormessage];
}

class SignInLoadingState extends SignInState {
  @override
  List<Object?> get props => [];
}
