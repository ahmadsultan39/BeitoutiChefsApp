
import 'package:beitouti_chefs/core/data/base_local_data_source.dart';
import 'package:beitouti_chefs/features/subscriptions/data/data_sources/local/subscriptions_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: SubscriptionsLocalDataSource)
class SubscriptionsLocalDataSourceImp extends BaseLocalDataSourceImpl implements SubscriptionsLocalDataSource
{
  SubscriptionsLocalDataSourceImp({required SharedPreferences sharedPreferences}) : super(sharedPreferences: sharedPreferences);

}