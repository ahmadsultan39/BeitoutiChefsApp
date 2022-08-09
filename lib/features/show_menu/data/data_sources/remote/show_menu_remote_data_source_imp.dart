import 'dart:convert';

import 'package:beitouti_chefs/core/models/meal_model.dart';
import 'package:beitouti_chefs/features/show_menu/data/data_sources/remote/show_menu_remote_data_source.dart';
import 'package:beitouti_chefs/features/show_menu/data/models/meals_info_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/base_remote_datasource.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/models/category_model.dart';
import '../../../../../core/network/models/base_response_model.dart';
import '../../../../../core/util/constants.dart';

@LazySingleton(as: ShowMenuRemoteDataSource)
class ShowMenuRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements ShowMenuRemoteDataSource {
  ShowMenuRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<List<CategoryModel>> getCategories({required String token}) async =>
      await performGetListRequest<CategoryModel>(
        endpoint: Endpoints.getCategories,
        token: token,
      );

  @override
  Future<MealsInfoModel> getActiveMealsCount({required String token}) async =>
      await performGetRequest<MealsInfoModel>(
        Endpoints.getMealsActiveCount,
        token,
      );

  @override
  Future<List<MealModel>> getCategoryMeals(
          {required String token, required int categoryId}) async =>
      await performGetListRequest<MealModel>(
        endpoint: Endpoints.getCategoryMeals(categoryId),
        token: token,
      );

  @override
  Future<void> changeMealAvailability(
      {required String token, required int mealId}) async {
    await performPutRequest<Null>(endpoint: Endpoints.changeMealAvailability(mealId), options: GetOptions.getOptionsWithToken(token));
  }

  @override
  Future<void> decreaseMaxMealNumber(
      {required String token, required int mealId}) async {
    await performPutRequest<Null>(endpoint: Endpoints.decreaseMaxMealNumber(mealId),
        options: GetOptions.getOptionsWithToken(token));
  }

  @override
  Future<void> deleteMeal({required String token, required int mealId}) async {
    await performDeleteRequest<Null>(endpoint: Endpoints.deleteMeal(mealId),
        token: token);
  }

  @override
  Future<void> increaseMaxMealNumber(
      {required String token, required int mealId}) async {
    await performPutRequest<Null>(endpoint: Endpoints.increaseMaxMealNumber(mealId),
        options: GetOptions.getOptionsWithToken(token));
  }
}
