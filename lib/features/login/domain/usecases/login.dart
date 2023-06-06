import 'package:dartz/dartz.dart';
import 'package:pokemon/core/base_use_case.dart';
import 'package:pokemon/core/errors/failures.dart';
import 'package:pokemon/features/login/domain/repositories/login_repository.dart';

class Login extends UseCase<LoginParams, void> {
  final LoginRepository repository;

  Login({required this.repository});

  @override
  Future<Either<Failure, void>> call({required LoginParams params}) async {
    return await repository.login(loginParams: params);
  }
}

class LoginParams {
  String email;
  String password;
  LoginParams({
    required this.email,
    required this.password,
  });
}
