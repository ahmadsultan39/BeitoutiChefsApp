
import '../../../../../core/data/base_remote_datasource.dart';
import '../../models/time_order_model.dart';
import '../../models/orders_times_model.dart';

abstract class OrdersRemoteDataSource extends BaseRemoteDataSource {

  Future<List<OrdersTimesModel>> getOrdersTimes({required String token});

  Future<List<TimeOrderModel>> getTimeOrders({required String token,required String time});

  Future<void> changeStatus({required String token,required int orderId});

}