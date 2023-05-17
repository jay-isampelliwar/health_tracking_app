part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpButtonClickedActionEvent extends SignUpEvent {
  User model;
  SignUpButtonClickedActionEvent({
    required this.model,
  });

  @override
  List<Object> get props => [model];
}

class SignUpLoginActionEvent extends SignUpEvent {}

class SignUpShowPassword extends SignUpEvent {}

class SignUpHidePassword extends SignUpEvent {}
