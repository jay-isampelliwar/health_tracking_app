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
  AuthModel model;
  SignUpErrorActionState({
    required this.model,
  });

  @override
  List<Object> get props => [model];
}

class SignUpSuccessActionState extends SignUpActionState {
  AuthModel model;
  SignUpSuccessActionState({
    required this.model,
  });

  @override
  List<Object> get props => [model];
}
