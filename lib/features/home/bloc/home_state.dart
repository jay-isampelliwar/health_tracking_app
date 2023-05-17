part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeUpdateState extends HomeState {
  String distance;
  String calories;
  String points;
  HomeUpdateState(
      {required this.calories, required this.distance, required this.points});

  @override
  List<Object> get props => [distance, calories, points];
}

class HomeShowWaterDialogBoxState extends HomeActionState {}

class HomeWaterDecreaseState extends HomeState {
  int water;
  HomeWaterDecreaseState({
    required this.water,
  });
  @override
  List<Object> get props => [water];
}

class HomeWaterLevelDecreaseState extends HomeState {
  double val;
  HomeWaterLevelDecreaseState({
    required this.val,
  });
  @override
  List<Object> get props => [val];
}

class HomeWaterLevelIncreaseState extends HomeState {
  double val;
  HomeWaterLevelIncreaseState({
    required this.val,
  });
  @override
  List<Object> get props => [val];
}

class HomeWaterLevelUpdate extends HomeState {
  String numberOfGlasses;
  HomeWaterLevelUpdate({
    required this.numberOfGlasses,
  });

  @override
  List<Object> get props => [numberOfGlasses];
}

class HomeLoadingState extends HomeState {}

class HomeErrorActionState extends HomeActionState {
  String message;
  HomeErrorActionState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class HomeSuccessState extends HomeActionState {
  AchievementDataModel achievementDataModel;
  DataModel dataModel;
  UserDetailsModel userDetailsModel;
  HomeSuccessState({
    required this.achievementDataModel,
    required this.dataModel,
    required this.userDetailsModel,
  });

  @override
  List<Object> get props => [achievementDataModel, dataModel];
}
