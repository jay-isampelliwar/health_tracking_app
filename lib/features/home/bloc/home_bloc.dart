import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_tracking_app/features/home/model/user.dart';
import 'package:health_tracking_app/features/home/repo/repo.dart';
import 'package:health_tracking_app/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) async {
      //!loading
      log("Initiated");
      UserModel userModel = await locator.get<HomeRepo>().userDetail();

      if (userModel.status) {
        log(userModelToJson(userModel));
      } else {
        log(userModel.message);
      }
    });
  }
}
