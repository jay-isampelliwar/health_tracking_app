part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

abstract class SignUpActionState extends SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpButtonLoadingState extends SignUpState {}

class SignUpErrorActionState extends SignUpActionState {
  String message;
  SignUpErrorActionState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class SignUpSuccessActionState extends SignUpActionState {
  String message;
  SignUpSuccessActionState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
