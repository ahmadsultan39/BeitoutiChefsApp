import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/orders_times.dart';
import '../entities/time_order.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrdersTimes>>> getOrdersTimes({
    required String day,
  });

  Future<Either<Failure, List<TimeOrder>>> getTimeOrders({
    required String time,
    required String day,
  });

  Future<Either<Failure, void>> changeStatus({
    required int orderId,
  });
}
