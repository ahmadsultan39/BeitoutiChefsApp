import 'package:beitouti_chefs/features/add_meal/domain/use_cases/edit_meal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../features/add_meal/domain/use_cases/add_meal.dart';

class Endpoints {
  static const BASE_URL = "https://e52d-31-9-96-236.ngrok.io/api/chef";
  static const url = "https://e52d-31-9-96-236.ngrok.io";
  static const GET_CATEGORIES = "/meals/categories";
  static const GET_MEALS_ACTIVE_COUNT = "/meals/active-count";
  static const CREATE_CATEGORY = "/meals/category";
  static const ADD_MEAL = "/meals/";

  static String getCategoryMeals(int categoryId) =>
      "/meals/categories/$categoryId";

  static String getFinalPrice(int price) => "/meals/meal/$price";

  static String changeMealAvailability(int mealId) =>
      "/meals/$mealId/edit-availability";

  static String decreaseMaxMealNumber(int mealId) =>
      "/meals/$mealId/subtract-portion";

  static String deleteMeal(int mealId) => "/meals/$mealId/";

  static String editMeal(int mealId) => "/meals/$mealId?_method=PUT";

  static String increaseMaxMealNumber(int mealId) =>
      "/meals/$mealId/add-portion";
}

class SharedPreferencesKeys {
  static const API_TOKEN = "";
}

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHE_FAILURE_MESSAGE = 'Cache Failure';

final OPTION = Options(
  headers: {
    'Accept': 'application/json',
  },
);

final BASE_OPTIONS = BaseOptions(
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
);

class RequestBody {
  static FormData createCategory({
    required String name,
  }) {
    return FormData.fromMap({
      'category_name': name,
    });
  }

  static Future<FormData> addMeal({
    required AddMealUseCaseParams params,
  }) async {
    return FormData.fromMap({
      'image': await MultipartFile.fromFile(params.pickedImage.path,
          filename: params.pickedImage.name),
      'name': params.name,
      'category_id': params.categoryId,
      'ingredients': params.ingredients,
      'expected_preparation_time': params.preparingTime,
      'max_meals_per_day': params.maxMeals,
      'price': params.price,
      'discount_percentage': params.discount,
    });
  }

  static Future<FormData> editMeal({
    required EditMealUseCaseParams params,
  }) async {
    final form = FormData.fromMap({
      if (params.pickedImage != null)
        'image': await MultipartFile.fromFile(params.pickedImage!.path,
            filename: params.pickedImage!.name),
      'name': params.name,
      'category_id': params.categoryId,
      'ingredients': params.ingredients,
      'expected_preparation_time': params.preparingTime,
      'max_meals_per_day': params.maxMeals,
      if (params.priceEditReason != null) 'price': params.price,
      if (params.priceEditReason != null) 'reason': params.priceEditReason,
      'discount_percentage': params.discount,
    });
    print(form.fields.first);
    return form;
  }
}

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String? tok ,{int isPagination = 0}) {
    String? token = "63|CXRPIkEEUtAS60pcqNAkNMZsuOgGrOhgroLWFolT";
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'is-pagination': isPagination,
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
    return options;
  }
}

class ErrorMessage {
  static String ERROR401 = "something_went_wrong";
}

void error({
  required String errorMsg,
  context,
  bloc,
}) {
  debugPrint('Error message is "$errorMsg"');
  debugPrint(bloc.state.toString());
  if (errorMsg.isNotEmpty) {
    Fluttertoast.showToast(
      msg: errorMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      //Color.fromRGBO(255, 86, 31, 1),
      fontSize: 16.0,
    );
    bloc?.clearError();
  }
}
