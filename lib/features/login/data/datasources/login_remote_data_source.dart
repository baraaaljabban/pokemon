import 'package:pokemon/core/errors/error_handler.dart';

abstract class LoginRemoteDataSource {
  bool login({
    required String email,
    required String password,
  });
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource with CustomErrorHandler {
  @override
  bool login({required String email, required String password}) {
    return true;
  }
}
