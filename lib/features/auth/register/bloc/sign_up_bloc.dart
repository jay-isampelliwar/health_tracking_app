import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_tracking_app/features/auth/model/auth_model.dart';
import 'package:health_tracking_app/features/auth/repo/repo.dart';
import 'package:health_tracking_app/locator.dart';

import '../../model/user_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonClickedActionEvent>(signUpButtonClickedActionEvent);
    on<SignUpLoginActionEvent>(signUpLoginActionEvent);
    on<SignUpShowPassword>(signUpShowPassword);
    on<SignUpHidePassword>(signUpHidePassword);
  }

  FutureOr<void> signUpButtonClickedActionEvent(
      SignUpButtonClickedActionEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpButtonLoadingState());
    AuthModel authModel =
        await locator.get<AuthRepo>().registration(event.model);
    emit(SignUpInitial());
    if (authModel.status) {
      emit(SignUpSuccessActionState(message: authModel.message));
    } else {
      emit(SignUpErrorActionState(message: authModel.message));
    }
  }

  FutureOr<void> signUpLoginActionEvent(
      SignUpLoginActionEvent event, Emitter<SignUpState> emit) {}

  FutureOr<void> signUpShowPassword(
      SignUpShowPassword event, Emitter<SignUpState> emit) {}

  FutureOr<void> signUpHidePassword(
      SignUpHidePassword event, Emitter<SignUpState> emit) {}
}
