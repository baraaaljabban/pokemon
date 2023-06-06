import 'package:pokemon/core/constant/shared_pereference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StartUpLocalDataSource {
  bool isUserLoggedIn();
}

class StartUpLocalDataSourceImpl extends StartUpLocalDataSource {
  final SharedPreferences sharedPreferences;

  StartUpLocalDataSourceImpl({required this.sharedPreferences});
  @override
  bool isUserLoggedIn() {
    final token = sharedPreferences.getBool(IS_USER_LOG_IN);
    if (token == null || token == false) {
      return false;
    } else {
      return true;
    }
  }
}
