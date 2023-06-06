import 'package:dartz/dartz.dart';
import 'package:pokemon/core/errors/error_handler.dart';
import 'package:pokemon/core/errors/failures.dart';
import 'package:pokemon/features/login/data/datasources/login_local_data_source.dart';
import 'package:pokemon/features/login/data/datasources/login_remote_data_source.dart';
import 'package:pokemon/features/login/domain/repositories/login_repository.dart';
import 'package:pokemon/features/login/domain/usecases/login.dart';

class LoginRepositoryImpl extends LoginRepository with CustomErrorHandler {
  final LoginLocalDataSource localDataSource;
  final LoginRemoteDataSource remoteDataSource;
  LoginRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> login({required LoginParams loginParams}) async {
    try {
      remoteDataSource.login(email: loginParams.email, password: loginParams.password);
      localDataSource.setUserToLoggedIn();
      return right(null);
    } catch (e) {
      if (e is Exception) {
        return Left(mapCommonExceptionToFailure(e));
      }

      return Left(UnhandledFailure(message: e.toString()));
    }
  }
}
