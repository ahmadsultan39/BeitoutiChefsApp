import 'package:beitouti_chefs/features/show_menu/data/data_sources/local/show_menu_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/data/base_local_data_source.dart';

@LazySingleton(as: ShowMenuLocalDataSource)
class ShowMenuLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements ShowMenuLocalDataSource {
  ShowMenuLocalDataSourceImp({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);
}
