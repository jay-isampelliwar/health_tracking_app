part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileActionState extends ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfilePostLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileActionState {
  String message;
  ProfileSuccessState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class ProfileErrorState extends ProfileActionState {
  String message;
  ProfileErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
