import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_tracking_app/core/helper/helper.dart';
import 'package:health_tracking_app/features/home/model/user_details_model.dart';
import 'package:health_tracking_app/features/home/repo/repo.dart';
import 'package:hive/hive.dart';

import '../../achievement/model/achievement_model.dart';
import '../../achievement/repo/repo.dart';
import '../../stats/model/stats_data.dart';
import '../../stats/repo/repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final localDatabase = Hive.box("localData");

  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadingEvent>(homeLoadingEvent);
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
    double points =
        Helper.calculatePoints(event.steps % event.divider, calories);

    double steps = event.steps % event.divider;
    localDatabase.put("calories", calories);
    localDatabase.put("distance", distance);
    localDatabase.put("points", points);
    localDatabase.put("steps", steps);
    emit(HomeUpdateState(
      calories: calories.toStringAsFixed(3),
      distance: distance.toStringAsFixed(3),
      points: points.toStringAsFixed(2),
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
    emit(HomeWaterLevelUpdate(
        numberOfGlasses: localDatabase.get("glassWater").toString()));
  }

  FutureOr<void> homeDialogBoxCloseButtonActionEvent(
      HomeDialogBoxCloseButtonActionEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeLoadingEvent(
      HomeLoadingEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    AchievementDataModel? achievementDataModel;
    DataModel? dataModel;
    UserDetailsModel? user;
    await Future.wait([
      AchievementRepo().getAchievement(),
      StatsRepo().getData(),
      HomeRepo().userDetail()
    ]).then((result) {
      achievementDataModel = result[0] as AchievementDataModel;
      dataModel = result[1] as DataModel;
      user = result[2] as UserDetailsModel;
    }).then((result) {
      emit(HomeInitial());
      if (achievementDataModel!.status && dataModel!.status && user!.status) {
        emit(HomeSuccessState(
            achievementDataModel: achievementDataModel!,
            dataModel: dataModel!,
            userDetailsModel: user!));
      } else if (!achievementDataModel!.status) {
        emit(HomeErrorActionState(message: "Unable to fetch Achievement data"));
      } else if (!dataModel!.status) {
        emit(HomeErrorActionState(message: "Unable to fetch Stats data"));
      } else if (!user!.status) {
        emit(HomeErrorActionState(message: "Unable to fetch user details"));
      }
    });
  }
}
