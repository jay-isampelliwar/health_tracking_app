part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpActionState extends OtpState {}

class OtpInitial extends OtpState {}

class OtpLoadingState extends OtpState {}

class OtpErrorState extends OtpActionState {
  String message;
  OtpErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class OtpSuccessState extends OtpActionState {
  String message;
  OtpSuccessState({required this.message});
  @override
  List<Object> get props => [message];
}
