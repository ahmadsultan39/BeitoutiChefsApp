
import 'package:beitouti_chefs/features/subscriptions/domain/entities/subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/repositories/subscriptions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetSubscriptionsUseCase implements UseCase<List<Subscription>, NoParams> {
  final SubscriptionsRepository _repository;

  GetSubscriptionsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Subscription>>> call(NoParams params) {
    return _repository.getSubscriptions();
  }
}