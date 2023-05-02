import 'dart:async';

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
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfilePostLoadingEvent>(profilePostLoadingEvent);
  }

  FutureOr<void> profilePostLoadingEvent(
      ProfilePostLoadingEvent event, Emitter<ProfileState> emit) async {
    emit(ProfilePostLoadingState());

    UserModel userModel = await locator.get<HomeRepo>().postData(UserDataModel(
        calories_burned: localDB.get("calories"),
        walk_distance: localDB.get("distance"),
        water: localDB.get("glassWater"),
        points: localDB.get("points"),
        step_count: localDB.get("steps")));

    emit(ProfileInitial());
    if (userModel.status) {
      emit(ProfileSuccessState(message: userModel.message));
    } else {
      emit(ProfileErrorState(message: userModel.message));
    }
  }
}
