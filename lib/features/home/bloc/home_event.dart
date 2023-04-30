part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class HomeUpdateEvent extends HomeEvent {}

class HomeInitialStepCountEvent extends HomeEvent {
  int steps;

  HomeInitialStepCountEvent({required this.steps});

  @override
  List<Object> get props => [steps];
}

class WaterContainerClickedEvent extends HomeEvent {}

class HomeWaterDecreaseEvent extends HomeEvent {
  int water;
  HomeWaterDecreaseEvent({
    required this.water,
  });
  @override
  List<Object> get props => [water];
}

class HomeWaterIncreaseEvent extends HomeEvent {
  int water;
  HomeWaterIncreaseEvent({
    required this.water,
  });
  @override
  List<Object> get props => [water];
}
