import 'dart:convert';

import 'package:beitouti_chefs/core/data/base_remote_datasource.dart';
import 'package:beitouti_chefs/core/models/category_model.dart';
import 'package:beitouti_chefs/features/add_meal/data/data_sources/remote/add_meal_remote_data_source.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/add_meal.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/edit_meal.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/models/base_response_model.dart';
import '../../../../../core/util/constants.dart';

@LazySingleton(as: AddMealRemoteDataSource)
class AddMealRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements AddMealRemoteDataSource {
  AddMealRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<List<CategoryModel>> getCategories(String token) async =>
      await performGetListRequest<CategoryModel>(
        endpoint: Endpoints.getCategories,
        token: token,
      );

  @override
  Future<CategoryModel> addCategory(
      {required String token, required String name}) async {
    return (await performPostRequest<CategoryModel>(endpoint: Endpoints.createCategory, data: RequestBody.createCategory(name: name),
        options: GetOptions.getOptionsWithToken(token)))!;
  }

  @override
  Future<void> addMeal(
      {required String token, required AddMealUseCaseParams params}) async {
    await performPostRequest<Null>(
        endpoint: Endpoints.addMeal,
        data: await RequestBody.addMeal(params: params),
        options: GetOptions.getOptionsWithToken(token));
  }

  @override
  Future<void> editMeal({
    required String token,
    required EditMealUseCaseParams params,
  }) async {
    await performPostRequest<Null>(endpoint: Endpoints.editMeal(params.mealId),
        data: await RequestBody.editMeal(params: params),
        options: GetOptions.getOptionsWithToken(token));
  }

  @override
  Future<int> getFinalPrice({required String token, required int price}) async {
    final response = await dio.get(
      Endpoints.getFinalPrice(price),
      options: GetOptions.getOptionsWithToken(token),
    );
    if (response.statusCode == 200) {
      final result = json.decode(response.data)["data"]["student_price"];
      print(result);
      return result;
    } else {
      throw ServerException(error: ErrorMessage.someThingWentWrong);
    }
  }
}
