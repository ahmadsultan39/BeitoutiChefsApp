import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/orders_times.dart';
import '../repositories/orders_repository.dart';

@lazySingleton
class GetOrdersTimesUseCase implements UseCase<List<OrdersTimes>, ParamsGetOrdersTimeUseCase> {
  final OrdersRepository _repository;

  GetOrdersTimesUseCase(this._repository);

  @override
  Future<Either<Failure, List<OrdersTimes>>> call(ParamsGetOrdersTimeUseCase params) {
    return _repository.getOrdersTimes(day: params.day);
  }
}

class ParamsGetOrdersTimeUseCase extends Equatable {
  final String day;

  const ParamsGetOrdersTimeUseCase({required this.day});

  @override
  List<Object?> get props => [day];
}
