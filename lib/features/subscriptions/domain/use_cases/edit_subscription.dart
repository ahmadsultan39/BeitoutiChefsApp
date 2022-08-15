import 'package:beitouti_chefs/features/subscriptions/domain/entities/new_subscription.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/subscriptions_repository.dart';

@lazySingleton
class EditSubscriptionUseCase
    implements UseCase<void, ParamsEditSubscriptionUseCase> {
  final SubscriptionsRepository _repository;

  EditSubscriptionUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsEditSubscriptionUseCase params) {
    return _repository.editSubscription(newSubscription: params.newSubscription);
  }
}

class ParamsEditSubscriptionUseCase extends Equatable {
  final NewSubscription newSubscription;

  const ParamsEditSubscriptionUseCase(this.newSubscription);

  @override
  List<Object?> get props => [newSubscription];
}