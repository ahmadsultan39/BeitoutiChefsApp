import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/data/base_local_datasource.dart';
import 'splash_local_data_source.dart';

@LazySingleton(as: SplashLocalDataSource)
class SplashLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements SplashLocalDataSource {
  SplashLocalDataSourceImp({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);
}
