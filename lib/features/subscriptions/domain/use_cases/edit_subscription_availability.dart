import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/subscriptions_repository.dart';

@lazySingleton
class EditSubscriptionAvailabilityUseCase implements UseCase<String, ParamsEditSubscriptionAvailabilityUseCase> {
  final SubscriptionsRepository _repository;

  EditSubscriptionAvailabilityUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(ParamsEditSubscriptionAvailabilityUseCase params) {
    return _repository.editSubscriptionAvailability(id: params.id);
  }
}

class ParamsEditSubscriptionAvailabilityUseCase extends Equatable{
  final int id;

  const ParamsEditSubscriptionAvailabilityUseCase(this.id);

  @override
  List<Object?> get props => [id];
}