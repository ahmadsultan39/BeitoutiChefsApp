import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/time_order.dart';
import '../repositories/orders_repository.dart';

@lazySingleton
class GetTimeOrdersUseCase
    implements UseCase<List<TimeOrder>, ParamsGetTimeOrdersUseCase> {
  final OrdersRepository _repository;

  GetTimeOrdersUseCase(this._repository);

  @override
  Future<Either<Failure, List<TimeOrder>>> call(
      ParamsGetTimeOrdersUseCase params) {
    return _repository.getTimeOrders(
      time: params.time,
      day: params.day,
    );
  }
}

class ParamsGetTimeOrdersUseCase extends Equatable {
  final String time;
  final String day;

  const ParamsGetTimeOrdersUseCase({
    required this.time,
    required this.day,
  });

  @override
  List<Object?> get props => [time, day];
}
