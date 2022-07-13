import 'package:beitouti_chefs/features/subscriptions/domain/entities/new_subscription.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/subscriptions_repository.dart';

@lazySingleton
class AddNewSubscriptionUseCase
    implements UseCase<String, ParamsAddNewSubscriptionUseCase> {
  final SubscriptionsRepository _repository;

  AddNewSubscriptionUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(ParamsAddNewSubscriptionUseCase params) {
    return _repository.addNewSubscription(newSubscription: params.newSubscription);
  }
}

class ParamsAddNewSubscriptionUseCase extends Equatable {
  final NewSubscription newSubscription;

  const ParamsAddNewSubscriptionUseCase(this.newSubscription);

  @override
  List<Object?> get props => [newSubscription];
}
