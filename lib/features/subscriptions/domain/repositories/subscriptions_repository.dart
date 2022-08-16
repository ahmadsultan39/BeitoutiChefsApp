import 'package:beitouti_chefs/core/data/base_repository.dart';
import 'package:beitouti_chefs/core/error/failures.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/add_subscription_meal.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/new_subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/subscription.dart';
import 'package:dartz/dartz.dart';

abstract class SubscriptionsRepository extends BaseRepository {
  Future<Either<Failure,List<Subscription>>> getSubscriptions();

  Future<Either<Failure,List<AddSubscriptionMeal>>> getChefMeals();

  Future<Either<Failure, void>> deleteSubscription({required int id});

  Future<Either<Failure, String>> editSubscriptionAvailability({required int id});

  Future<Either<Failure, void>> addNewSubscription({required NewSubscription newSubscription});

  Future<Either<Failure, void>> editSubscription({required NewSubscription newSubscription});
}