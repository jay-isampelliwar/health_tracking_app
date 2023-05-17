part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpButtonClickedEvent extends OtpEvent {
  User model;
  OtpButtonClickedEvent({required this.model});

  @override
  List<Object> get props => [model];
}
