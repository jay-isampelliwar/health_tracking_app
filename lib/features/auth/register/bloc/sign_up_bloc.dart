import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_tracking_app/api_provider/api_provider.dart';
import 'package:health_tracking_app/features/auth/model/auth_model.dart';

import '../../model/user_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final ApiProvider _apiProvider = ApiProvider();
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonClickedActionEvent>(signUpButtonClickedActionEvent);
    on<SignUpLoginActionEvent>(signUpLoginActionEvent);
    on<SignUpShowPassword>(signUpShowPassword);
    on<SignUpHidePassword>(signUpHidePassword);
  }

  FutureOr<void> signUpButtonClickedActionEvent(
      SignUpButtonClickedActionEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpButtonLoadingState());
    AuthModel authModel = await _apiProvider.registration(event.model);

    if (authModel.status) {
      emit(SignUpInitial());

      emit(SignUpSuccessActionState(message: authModel.message));
    } else {
      emit(SignUpInitial());
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
