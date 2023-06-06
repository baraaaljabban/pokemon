import 'package:dartz/dartz.dart';
import 'package:pokemon/core/errors/failures.dart';

abstract class StartUpRepository {
  /// function will check local DB and verify if there is already existing JWT-Token or not
  /// return [bool] if the fetch is successful  of [Failure] if there was issue reading local DB for any reason
  Future<Either<Failure, bool>> isLoggedIn();
}
