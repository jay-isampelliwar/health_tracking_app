import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeInitialStepCountEvent>(homeInitialStepCountEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeInitialStepCountEvent(
      HomeInitialStepCountEvent event, Emitter<HomeState> emit) {
    emit(HomeUpdateCounterState(steps: event.steps));
  }
}
