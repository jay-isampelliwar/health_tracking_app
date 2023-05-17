part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginHomeActionEvent extends LoginEvent {
  User model;
  LoginHomeActionEvent({required this.model});
  @override
  List<Object> get props => [model];
}

class LoginShowPassword extends LoginEvent {}

class LoginHidePassword extends LoginEvent {}
