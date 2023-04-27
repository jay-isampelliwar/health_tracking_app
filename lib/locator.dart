import 'package:get_it/get_it.dart';
import 'package:health_tracking_app/features/achievement/bloc/achievement_bloc.dart';
import 'package:health_tracking_app/features/auth/login/bloc/login_bloc.dart';
import 'package:health_tracking_app/features/auth/register/bloc/sign_up_bloc.dart';
import 'package:health_tracking_app/features/auth/repo/repo.dart';
import 'package:health_tracking_app/features/goal/bloc/goal_bloc.dart';
import 'package:health_tracking_app/features/home/bloc/home_bloc.dart';
import 'package:health_tracking_app/features/stats/bloc/stats_bloc.dart';

GetIt locator = GetIt.instance;
void setup() {
  locator.registerLazySingleton<HomeBloc>(() => HomeBloc());
  locator.registerLazySingleton<LoginBloc>(() => LoginBloc());
  locator.registerLazySingleton<SignUpBloc>(() => SignUpBloc());
  locator.registerLazySingleton<AchievementBloc>(() => AchievementBloc());
  locator.registerLazySingleton<StatsBloc>(() => StatsBloc());
  locator.registerLazySingleton<GoalBloc>(() => GoalBloc());

  locator.registerLazySingleton<AuthRepo>(() => AuthRepo());
}
