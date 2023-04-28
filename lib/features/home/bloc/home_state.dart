part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeUpdateCounterState extends HomeState {
  int steps;
  HomeUpdateCounterState({required this.steps});

  @override
  List<Object> get props => [steps];
}
