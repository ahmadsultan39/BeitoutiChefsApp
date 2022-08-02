import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/data/base_local_data_source.dart';
import '../../../../../core/util/constants.dart';
import '../../models/user_model.dart';

import 'auth_local_data_source.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements AuthLocalDataSource {
  AuthLocalDataSourceImp({
    required SharedPreferences sharedPreferences,
  }) : super(sharedPreferences: sharedPreferences);

  @override
  Future<void> saveUser(UserModel user) async {
    sharedPreferences.setInt(
      SharedPreferencesKeys.userId,
      user.id,
    );
    sharedPreferences.setString(
      SharedPreferencesKeys.userName,
      user.name,
    );
    sharedPreferences.setString(
      SharedPreferencesKeys.userEmail,
      user.email,
    );
    sharedPreferences.setString(
      SharedPreferencesKeys.apiToken,
      user.accessToken,
    );
    sharedPreferences.setString(
      SharedPreferencesKeys.userPhoneNumber,
      user.phoneNumber,
    );
  }
}
