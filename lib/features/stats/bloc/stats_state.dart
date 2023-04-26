part of 'stats_bloc.dart';

abstract class StatsState extends Equatable {
  const StatsState();
  
  @override
  List<Object> get props => [];
}

class StatsInitial extends StatsState {}
