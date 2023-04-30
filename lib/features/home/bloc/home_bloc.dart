import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<WaterContainerClickedEvent>(waterContainerClickedEvent);
    on<HomeInitialStepCountEvent>(homeInitialStepCountEvent);
    on<HomeWaterIncreaseEvent>(homeWaterIncreaseEvent);
    on<HomeWaterDecreaseEvent>(homeWaterDecreaseEvent);
    on<HomeUpdateEvent>(homeUpdateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeInitialStepCountEvent(
      HomeInitialStepCountEvent event, Emitter<HomeState> emit) {
    emit(HomeUpdateCounterState(steps: event.steps));
  }

  FutureOr<void> waterContainerClickedEvent(
      WaterContainerClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeShowWaterDialogBoxState());
    emit(HomeInitial());
  }

  FutureOr<void> homeWaterDecreaseEvent(
      HomeWaterDecreaseEvent event, Emitter<HomeState> emit) {
    emit(HomeWaterDecreaseState(water: event.water - 1));
  }

  FutureOr<void> homeWaterIncreaseEvent(
      HomeWaterIncreaseEvent event, Emitter<HomeState> emit) {
    emit(HomeWaterIncreaseState(water: event.water + 1));
  }

  FutureOr<void> homeUpdateEvent(
      HomeUpdateEvent event, Emitter<HomeState> emit) {
    emit(HomeInitial());
  }
}
