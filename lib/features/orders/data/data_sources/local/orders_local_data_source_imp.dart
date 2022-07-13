import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/data/base_local_data_source.dart';
import 'orders_local_data_source.dart';

@LazySingleton(as: OrdersLocalDataSource)
class OrdersLocalDataSourceImp extends BaseLocalDataSourceImpl implements OrdersLocalDataSource {
  OrdersLocalDataSourceImp({required SharedPreferences sharedPreferences}) : super(sharedPreferences: sharedPreferences);

}