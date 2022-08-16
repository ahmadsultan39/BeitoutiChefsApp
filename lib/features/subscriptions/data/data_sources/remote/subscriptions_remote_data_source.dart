import 'package:beitouti_chefs/core/data/base_remote_datasource.dart';
import 'package:beitouti_chefs/features/subscriptions/data/models/add_subscription_meal_model.dart';
import 'package:beitouti_chefs/features/subscriptions/data/models/subscription_model.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/new_subscription.dart';

abstract class SubscriptionsRemoteDataSource extends BaseRemoteDataSource {
  Future<List<SubscriptionModel>> getSubscriptions({required String token});

  Future<List<AddSubscriptionMealModel>> getChefMeals({required String token});

  Future<void> deleteSubscription({required String token,required int id});

  Future<String> editSubscriptionAvailability({required String token,required int id});

  Future<void> addNewSubscription({required String token,required NewSubscription newSubscription});

  Future<void> editSubscription({required String token,required NewSubscription newSubscription});

}