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

class HomeShowWaterDialogBoxState extends HomeActionState {}

class HomeWaterDecreaseState extends HomeState {
  int water;
  HomeWaterDecreaseState({
    required this.water,
  });
  @override
  List<Object> get props => [water];
}

class HomeWaterIncreaseState extends HomeState {
  int water;
  HomeWaterIncreaseState({
    required this.water,
  });
  @override
  List<Object> get props => [water];
}

class HomeWaterLevelDecreaseState extends HomeState {
  double val;
  HomeWaterLevelDecreaseState({
    required this.val,
  });
  @override
  List<Object> get props => [val];
}

class HomeWaterLevelIncreaseState extends HomeState {
  double val;
  HomeWaterLevelIncreaseState({
    required this.val,
  });
  @override
  List<Object> get props => [val];
}
