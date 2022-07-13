import 'dart:convert';

import 'package:beitouti_chefs/core/data/base_remote_datasource.dart';
import 'package:beitouti_chefs/features/subscriptions/data/data_sources/remote/subscriptions_remote_data_source.dart';
import 'package:beitouti_chefs/features/subscriptions/data/models/add_subscription_meal_model.dart';
import 'package:beitouti_chefs/features/subscriptions/data/models/subscription_model.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/new_subscription.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/models/base_response_model.dart';
import '../../../../../core/util/constants.dart';

@LazySingleton(as: SubscriptionsRemoteDataSource)
class SubscriptionsRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements SubscriptionsRemoteDataSource {
  SubscriptionsRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<void> deleteSubscription(
      {required String token, required int id}) async {
    try {
      final response = await dio.delete(
        Endpoints.deleteSubscription(id),
        options: GetOptions.getOptionsWithToken(token),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      final result =
          BaseResponseModel<Null>.fromJson(json.decode(e.response!.data));
      throw ServerException(error: result.errors!);
    }
  }

  @override
  Future<List<SubscriptionModel>> getSubscriptions({required String token}) =>
      performGetListRequest<SubscriptionModel>(
          Endpoints.getSubscriptions, token);

  @override
  Future<String> editSubscriptionAvailability(
      {required String token, required int id}) async {
    try {
      final response = await dio.put(
        Endpoints.editSubscriptionAvailability(id),
        options: GetOptions.getOptionsWithToken(token),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = json.decode(response.data)["data"] as String;
        return result;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      final result =
          BaseResponseModel<Null>.fromJson(json.decode(e.response!.data));
      throw ServerException(error: result.errors!);
    }
  }

  @override
  Future<String> addNewSubscription(
      {required String token, required NewSubscription newSubscription}) async {
    try {
      final response = await dio.post(
        Endpoints.addNewSubscription,
        options: GetOptions.getOptionsWithToken(token),
        data: RequestBody.addSubscription(newSubscription: newSubscription),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = json.decode(response.data)["data"]["message"] as String;
        return result;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      final result =
          BaseResponseModel<Null>.fromJson(json.decode(e.response!.data));
      throw ServerException(error: result.errors!);
    }
  }

  @override
  Future<String> editSubscription({
    required String token,
    required NewSubscription newSubscription,
  }) async {
    try {
      final response = await dio.post(
        Endpoints.editSubscription(newSubscription.id!),
        options: GetOptions.getOptionsWithToken(token),
        data: RequestBody.addSubscription(newSubscription: newSubscription),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = json.decode(response.data)["data"]["message"] as String;
        return result;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      final result =
          BaseResponseModel<Null>.fromJson(json.decode(e.response!.data));
      throw ServerException(error: result.errors!);
    }
  }

  @override
  Future<List<AddSubscriptionMealModel>> getChefMeals(
          {required String token}) =>
      performGetListRequest<AddSubscriptionMealModel>(
          Endpoints.getChefMeals, token);
}
