import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_tracking_app/features/achievement/model/achievement_model.dart';
import 'package:health_tracking_app/features/home/model/achievement.dart';
import 'package:health_tracking_app/features/home/model/user.dart';
import 'package:health_tracking_app/features/home/model/user_data.dart';
import 'package:health_tracking_app/features/home/repo/repo.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive/hive.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final localDB = Hive.box("localData");
  final box = Hive.box("stepCounter");
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfilePostLoadingEvent>(profilePostLoadingEvent);
  }

  FutureOr<void> profilePostLoadingEvent(
      ProfilePostLoadingEvent event, Emitter<ProfileState> emit) async {
    emit(ProfilePostLoadingState());
    UserModel? userModel;
    AchievementDataModel? achievementDataModel;
    await Future.wait([
      locator.get<HomeRepo>().postData(UserDataModel(
            calories_burned: localDB.get("calories") + 0.0,
            walk_distance: localDB.get("distance") + 0.0,
            water: localDB.get("glassWater") + 0.0,
            points: localDB.get("points") + 0.0,
            step_count: localDB.get("steps") + 0.0,
          )),
      locator.get<HomeRepo>().postAchievement(AchievementModel(
            highestPoint: Metric(
                date: DateTime.now(), value: localDB.get("points") + 0.0),
            highestDistance: Metric(
                date: DateTime.now(), value: localDB.get("distance") + 0.0),
            highestWater: Metric(
                date: DateTime.now(), value: localDB.get("glassWater") + 0.0),
            highestStepCount:
                Metric(date: DateTime.now(), value: localDB.get("steps") + 0.0),
            highestCalorieBurned: Metric(
                date: DateTime.now(), value: localDB.get("calories") + 0.0),
          )),
    ]).then((result) {
      userModel = result[0] as UserModel;
      achievementDataModel = result[1] as AchievementDataModel;
    });

    emit(ProfileInitial());
    if (userModel!.status && achievementDataModel!.status) {
      emit(ProfileSuccessState(
          message: userModel!.message + achievementDataModel!.message));
      localDB.put("calories", 0);
      localDB.put("distance", 0);
      localDB.put("glassWater", 0);
      localDB.put("points", 0);
      localDB.put("steps", 0);
      box.put("stepValue", -1);
    } else if (userModel!.status) {
      emit(ProfileErrorState(message: "Unable to save data try again"));
    } else if (achievementDataModel!.status) {
      emit(ProfileErrorState(message: "Unable to save achievement try again"));
    } else {
      emit(ProfileErrorState(message: "Something went wrong"));
    }
  }
}
