import 'package:pokemon/core/constant/shared_pereference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  Future<bool> setUserToLoggedIn();
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  SharedPreferences sharedPreferences;
  LoginLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> setUserToLoggedIn() async {
    return sharedPreferences.setBool(IS_USER_LOG_IN, true);
  }
}
