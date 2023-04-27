import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_tracking_app/features/auth/model/auth_model.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';
import 'package:health_tracking_app/features/auth/repo/repo.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepo authRepo = AuthRepo();
  OtpBloc() : super(OtpInitial()) {
    on<OtpButtonClickedEvent>((event, emit) async {
      emit(OtpLoadingState());

      AuthModel authModel = await authRepo.verifyOtp(event.model);
      emit(OtpInitial());
      if (authModel.status) {
        emit(OtpSuccessState(message: authModel.message));
      } else {
        emit(OtpErrorState(message: authModel.message));
      }
    });
  }
}
