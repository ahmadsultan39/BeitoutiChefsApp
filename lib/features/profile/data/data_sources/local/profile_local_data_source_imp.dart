import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/data/base_local_data_source.dart';

import 'profile_local_data_source.dart';

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements ProfileLocalDataSource {
  ProfileLocalDataSourceImp({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);
}
