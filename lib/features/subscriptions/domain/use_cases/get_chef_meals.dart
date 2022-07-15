import 'package:beitouti_chefs/features/subscriptions/domain/entities/add_subscription_meal.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/repositories/subscriptions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetChefMealsUseCase implements UseCase<List<AddSubscriptionMeal>, NoParams> {
  final SubscriptionsRepository _repository;

  GetChefMealsUseCase(this._repository);

  @override
  Future<Either<Failure, List<AddSubscriptionMeal>>> call(NoParams params) {
    return _repository.getChefMeals();
  }
}