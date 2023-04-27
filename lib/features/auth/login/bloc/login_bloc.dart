import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_tracking_app/core/constants/token.dart';
import 'package:health_tracking_app/features/auth/model/auth_model.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';
import 'package:health_tracking_app/features/auth/repo/repo.dart';
import 'package:health_tracking_app/locator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
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
        token_value = authModel.data!.token;
        log(token_value!);
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
