import 'package:beitouti_chefs/features/orders/domain/repositories/orders_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class ChangeStatusUseCase implements UseCase<void, ParamsChangeStatusUseCase> {
  final OrdersRepository _repository;

  ChangeStatusUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsChangeStatusUseCase params) {
    return _repository.changeStatus(
      orderId: params.orderId,
    );
  }
}

class ParamsChangeStatusUseCase extends Equatable {
  final int orderId;

  const ParamsChangeStatusUseCase({
    required this.orderId,
  });

  @override
  List<Object?> get props => [orderId];
}