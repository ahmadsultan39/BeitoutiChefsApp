import 'package:beitouti_chefs/core/data/base_local_data_source.dart';
import 'package:beitouti_chefs/core/util/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_local_data_source.dart';

@LazySingleton(as: HomeLocalDataSource)
class HomeLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements HomeLocalDataSource {
  HomeLocalDataSourceImp({
    required SharedPreferences sharedPreferences,
  }) : super(sharedPreferences: sharedPreferences);

  @override
  Future<bool> getAvailabilityStatus() async =>
      sharedPreferences.getBool(SharedPreferencesKeys.availabilityStatus) ??
      false;

  @override
  Future<void> setAvailabilityStatus(bool value) async {
    await sharedPreferences.setBool(
      SharedPreferencesKeys.availabilityStatus,
      value,
    );
  }
}
