import 'package:get_it/get_it.dart';
import 'package:health_tracking_app/features/achievement/bloc/achievement_bloc.dart';
import 'package:health_tracking_app/features/auth/login/bloc/login_bloc.dart';
import 'package:health_tracking_app/features/auth/register/bloc/sign_up_bloc.dart';
import 'package:health_tracking_app/features/auth/repo/repo.dart';

import 'package:health_tracking_app/features/home/bloc/home_bloc.dart';
import 'package:health_tracking_app/features/home/repo/repo.dart';
import 'package:health_tracking_app/features/stats/bloc/stats_bloc.dart';

import 'features/achievement/repo/repo.dart';
import 'features/stats/repo/repo.dart';

GetIt locator = GetIt.instance;
void setup() {
  locator.registerLazySingleton<HomeBloc>(() => HomeBloc());
  locator.registerLazySingleton<LoginBloc>(() => LoginBloc());
  locator.registerLazySingleton<SignUpBloc>(() => SignUpBloc());
  locator.registerLazySingleton<AchievementBloc>(() => AchievementBloc());
  locator.registerLazySingleton<StatsBloc>(() => StatsBloc());

  locator.registerLazySingleton<AuthRepo>(() => AuthRepo());
  locator.registerLazySingleton<HomeRepo>(() => HomeRepo());
  locator.registerLazySingleton<AchievementRepo>(() => AchievementRepo());
  locator.registerLazySingleton<StatsRepo>(() => StatsRepo());
}
