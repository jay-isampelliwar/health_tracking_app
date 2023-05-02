part of 'stats_bloc.dart';

abstract class StatsEvent extends Equatable {
  const StatsEvent();

  @override
  List<Object> get props => [];
}

class StatsDateChangeEvent extends StatsEvent {
  int index;
  StatsDateChangeEvent({required this.index});

  @override
  List<Object> get props => [index];
}
