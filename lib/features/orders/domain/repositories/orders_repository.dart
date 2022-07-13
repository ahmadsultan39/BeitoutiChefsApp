import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/orders_times.dart';
import '../entities/time_order.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrdersTimes>>> getOrdersTimes();

  Future<Either<Failure, List<TimeOrder>>> getTimeOrders({required String time});

  Future<Either<Failure, void>> changeStatus({required int orderId});
}