import 'package:dartz/dartz.dart';
import 'package:pokemon/core/errors/failures.dart';
import 'package:pokemon/features/login/domain/usecases/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> login({required LoginParams loginParams});
}
