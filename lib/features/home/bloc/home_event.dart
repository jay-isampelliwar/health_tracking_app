part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeUpdateEvent extends HomeEvent {
  int steps;
  double divider;
  HomeUpdateEvent({
    required this.divider,
    required this.steps,
  });
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

class HomeWaterLevelUpdateEvent extends HomeEvent {
  bool add;
  HomeWaterLevelUpdateEvent({
    required this.add,
  });

  @override
  List<Object> get props => [add];
}

class HomeDialogBoxCloseButtonActionEvent extends HomeEvent {}
