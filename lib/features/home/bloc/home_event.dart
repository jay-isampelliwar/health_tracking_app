part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class HomeInitialStepCountEvent extends HomeEvent {
  int steps;

  HomeInitialStepCountEvent({required this.steps});

  @override
  List<Object> get props => [steps];
}
