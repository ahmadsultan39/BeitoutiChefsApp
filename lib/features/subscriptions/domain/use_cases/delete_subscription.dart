import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/subscriptions_repository.dart';

@lazySingleton
class DeleteSubscriptionUseCase implements UseCase<void, ParamsDeleteSubscriptionUseCase> {
  final SubscriptionsRepository _repository;

  DeleteSubscriptionUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsDeleteSubscriptionUseCase params) {
    return _repository.deleteSubscription(id: params.id);
  }
}

class ParamsDeleteSubscriptionUseCase extends Equatable{
  final int id;

  const ParamsDeleteSubscriptionUseCase(this.id);

  @override
  List<Object?> get props => [id];
}