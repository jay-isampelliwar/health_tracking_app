import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

    UserModel userModel = await locator.get<HomeRepo>().postData(UserDataModel(
          calories_burned: localDB.get("calories") + 0.0,
          walk_distance: localDB.get("distance") + 0.0,
          water: localDB.get("glassWater") + 0.0,
          points: localDB.get("points") + 0.0,
          step_count: localDB.get("steps") + 0.0,
        ));
    log(userModel.message);
    emit(ProfileInitial());
    if (userModel.status) {
      emit(ProfileSuccessState(message: userModel.message));
      localDB.put("calories", 0);
      localDB.put("distance", 0);
      localDB.put("glassWater", 0);
      localDB.put("points", 0);
      localDB.put("steps", 0);
      box.put("stepValue", -1);
    } else {
      emit(ProfileErrorState(message: userModel.message));
    }
  }
}
