part of 'stats_bloc.dart';

abstract class StatsState extends Equatable {
  const StatsState();

  @override
  List<Object> get props => [];
}

class StatsInitial extends StatsState {}

class StatsDateChangeState extends StatsState {
  int index;
  StatsDateChangeState({required this.index});
  @override
  List<Object> get props => [index];
}
