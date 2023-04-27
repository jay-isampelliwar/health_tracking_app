part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginActionState extends LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginActionState {
  String message;
  LoginSuccessState({required this.message});
  @override
  List<Object> get props => [message];
}

class LoginErrorState extends LoginActionState {
  String message;
  LoginErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class LoginHidePasswordState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginShowPasswordState extends LoginState {}
