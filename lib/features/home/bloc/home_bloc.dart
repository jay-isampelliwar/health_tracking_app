import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_tracking_app/core/helper/helper.dart';
import 'package:hive/hive.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final localDatabase = Hive.box("localData");

  HomeBloc() : super(HomeInitial()) {
    on<WaterContainerClickedEvent>(waterContainerClickedEvent);
    on<HomeUpdateEvent>(homeUpdateEvent);
    on<HomeWaterLevelUpdateEvent>(homeWaterLevelUpdateEvent);
    on<HomeDialogBoxCloseButtonActionEvent>(
        homeDialogBoxCloseButtonActionEvent);
  }

  FutureOr<void> waterContainerClickedEvent(
      WaterContainerClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeShowWaterDialogBoxState());
    emit(HomeUpdateState(
        calories: localDatabase.get("calories"),
        distance: localDatabase.get("distance")));
  }

  FutureOr<void> homeWaterDecreaseEvent(
      HomeWaterDecreaseEvent event, Emitter<HomeState> emit) {
    emit(HomeWaterDecreaseState(water: event.water - 1));
    emit(HomeUpdateState(
        calories: localDatabase.get("calories"),
        distance: localDatabase.get("distance")));
  }

  FutureOr<void> homeWaterIncreaseEvent(
      HomeWaterIncreaseEvent event, Emitter<HomeState> emit) {
    emit(HomeUpdateState(
        calories: localDatabase.get("calories"),
        distance: localDatabase.get("distance")));
  }

  FutureOr<void> homeUpdateEvent(
      HomeUpdateEvent event, Emitter<HomeState> emit) {
    String calories = Helper.calcCaloriesBurned(event.steps % event.divider);
    String distance = Helper.getDistance(event.steps % event.divider);
    localDatabase.put("calories", calories);
    localDatabase.put("distance", distance);
    emit(HomeUpdateState(calories: calories, distance: distance));
  }

  FutureOr<void> homeWaterLevelUpdateEvent(
      HomeWaterLevelUpdateEvent event, Emitter<HomeState> emit) {
    int get = localDatabase.get("event.divider") ?? 0;
    if (event.add) {
      localDatabase.put("glassWater", get + 1);
      get += 1;
    } else {
      localDatabase.put("glassWater", get - 1);
      get -= 1;
    }
    emit(HomeWaterLevelUpdate(numberOfGlasses: get.toString()));
  }

  FutureOr<void> homeDialogBoxCloseButtonActionEvent(
      HomeDialogBoxCloseButtonActionEvent event, Emitter<HomeState> emit) {
    emit(HomeUpdateState(
        calories: localDatabase.get("calories"),
        distance: localDatabase.get("distance")));
  }
}
