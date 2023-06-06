import '../../features/login/data/datasources/login_local_data_source.dart';
import '../../features/login/data/datasources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/usecases/login.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import 'dependencies.dart';

Future<void> registerLoginDeps() async {
  sl.registerSingleton<LoginRemoteDataSource>(
    LoginRemoteDataSourceImpl(),
  );

  sl.registerFactory<LoginLocalDataSource>(
    () => LoginLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerFactory<Login>(() => Login(repository: sl()));
  sl.registerLazySingleton<LoginBloc>(
    () => LoginBloc(
      login: sl(),
    ),
  );
}
