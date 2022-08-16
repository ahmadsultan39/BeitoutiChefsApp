import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/orders_times.dart';
import '../../domain/entities/time_order.dart';
import '../../domain/repositories/orders_repository.dart';
import '../data_sources/local/orders_local_data_source.dart';
import '../data_sources/remote/orders_remote_data_source.dart';

@LazySingleton(as: OrdersRepository)
class OrderRepositoryImp implements OrdersRepository {
  final OrdersLocalDataSource _local;
  final OrdersRemoteDataSource _remote;

  OrderRepositoryImp(this._local, this._remote);

  @override
  Future<Either<Failure, List<OrdersTimes>>> getOrdersTimes({
    required String day,
  }) async {
    try {
      final _token = await _local.token;
      final result = await _remote.getOrdersTimes(
        token: _token,
        day: day,
      );
      return Right(result);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, List<TimeOrder>>> getTimeOrders({
    required String time,
    required String day,
  }) async {
    try {
      final _token = await _local.token;
      final result = await _remote.getTimeOrders(
        token: _token,
        time: time,
        day: day,
      );
      return Right(result);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> changeStatus({required int orderId}) async {
    try {
      final _token = await _local.token;
      await _remote.changeStatus(
        token: _token,
        orderId: orderId,
      );
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }
}
