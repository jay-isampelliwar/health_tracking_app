import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc() : super(StatsInitial()) {
    on<StatsDateChangeEvent>((event, emit) {
      emit(StatsDateChangeState(index: event.index));
    });
  }
}
