import 'dart:async';
import 'dart:developer';

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
  }

  FutureOr<void> homeUpdateEvent(
      HomeUpdateEvent event, Emitter<HomeState> emit) {
    double calories = Helper.calcCaloriesBurned(event.steps % event.divider);
    double distance = Helper.getDistance(event.steps % event.divider);
    String points =
        Helper.calculatePoints(event.steps % event.divider, calories);

    double steps = event.steps % event.divider;
    localDatabase.put("calories", calories);
    localDatabase.put("distance", distance);
    localDatabase.put("points", points);
    localDatabase.put("steps", steps);
    emit(HomeUpdateState(
      calories: calories.toStringAsFixed(3),
      distance: distance.toStringAsFixed(3),
      points: points,
    ));
  }

  FutureOr<void> homeWaterLevelUpdateEvent(
      HomeWaterLevelUpdateEvent event, Emitter<HomeState> emit) {
    int get = localDatabase.get("glassWater");
    if (event.add) {
      localDatabase.put("glassWater", get + 1);
    } else {
      localDatabase.put("glassWater", get - 1);
    }
    log(localDatabase.get("glassWater").toString());
    emit(HomeWaterLevelUpdate(
        numberOfGlasses: localDatabase.get("glassWater").toString()));
  }

  FutureOr<void> homeDialogBoxCloseButtonActionEvent(
      HomeDialogBoxCloseButtonActionEvent event, Emitter<HomeState> emit) {}
}
