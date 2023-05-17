import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_tracking_app/features/auth/model/auth_model.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';
import 'package:health_tracking_app/features/auth/repo/repo.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive/hive.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final box = Hive.box("user");

  LoginBloc() : super(LoginInitial()) {
    on<LoginHomeActionEvent>(loginHomeActionEvent);
    on<LoginHidePassword>(loginHidePassword);
    on<LoginShowPassword>(loginShowPassword);
  }

  FutureOr<void> loginHomeActionEvent(
      LoginHomeActionEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoadingState());
      AuthModel authModel = await locator.get<AuthRepo>().login(event.model);
      emit(LoginInitial());
      if (authModel.status) {
        emit(LoginSuccessState(message: authModel.message));
        box.put("email", event.model.email);
        box.put("password", event.model.password);
        box.put("token", authModel.data!.token);
      } else {
        emit(LoginErrorState(message: authModel.message));
      }
    } catch (err) {
      emit(LoginInitial());
    }
  }

  FutureOr<void> loginHidePassword(
      LoginHidePassword event, Emitter<LoginState> emit) {}

  FutureOr<void> loginShowPassword(
      LoginShowPassword event, Emitter<LoginState> emit) {}
}
