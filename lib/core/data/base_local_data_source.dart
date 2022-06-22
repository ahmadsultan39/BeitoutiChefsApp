import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/constants.dart';

abstract class BaseLocalDataSource {
  Future<String> get token;

  Future<void> logout();
}

@LazySingleton(as: BaseLocalDataSource)
class BaseLocalDataSourceImp implements BaseLocalDataSource {
  final SharedPreferences sharedPreferences;

  BaseLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<void> logout() async =>
      sharedPreferences.remove(SharedPreferencesKeys.API_TOKEN);


  @override
  Future<String> get token async =>
      sharedPreferences.getString(SharedPreferencesKeys.API_TOKEN) ?? "";
}
