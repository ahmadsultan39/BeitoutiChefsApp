import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/orders_times.dart';
import '../repositories/orders_repository.dart';

@lazySingleton
class GetOrdersTimesUseCase implements UseCase<List<OrdersTimes>, NoParams> {
  final OrdersRepository _repository;

  GetOrdersTimesUseCase(this._repository);

  @override
  Future<Either<Failure, List<OrdersTimes>>> call(NoParams params) {
    return _repository.getOrdersTimes();
  }
}