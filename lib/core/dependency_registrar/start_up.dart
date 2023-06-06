import 'package:pokemon/core/dependency_registrar/dependencies.dart';
import 'package:pokemon/features/start_up/data/datasources/start_up_local_data_source.dart';
import 'package:pokemon/features/start_up/data/repositories/start_up_repository_impl.dart';
import 'package:pokemon/features/start_up/domain/repositories/start_up_repository.dart';
import 'package:pokemon/features/start_up/domain/usecases/logged_in.dart';
import 'package:pokemon/features/start_up/presentation/cubit/start_up_cubit.dart';

Future<void> registerStartUpDep() async {
  sl.registerLazySingleton<StartUpLocalDataSource>(
    () => StartUpLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerFactory<StartUpRepository>(
    () => StartUpRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerFactory(() => LoggedIn(repository: sl()));

  sl.registerLazySingleton<StartUpCubit>(
    () => StartUpCubit(
      loggedIn: sl(),
    ),
  );
}
