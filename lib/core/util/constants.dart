import 'dart:convert';

import 'package:beitouti_chefs/features/add_meal/domain/use_cases/edit_meal.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/new_subscription.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../features/auth/data/models/request_register_model.dart';
import '../../features/add_meal/domain/use_cases/add_meal.dart';

class Endpoints {
  static const baseUrl = "http://4183-46-213-207-239.ngrok.io/api/chef";
  static const url = "http://4183-46-213-207-239.ngrok.io";
  static const logout = "/logout";
  static const getCategories = "/meals/categories";
  static const getMealsActiveCount = "/meals/active-count";
  static const createCategory = "/meals/category";
  static const addMeal = "/meals/";
  static const ordersTimes = "/orders/meals";
  static const getSubscriptions = "/subscriptions/";
  static const addNewSubscription = "/subscriptions/";
  static const getChefMeals = "/meals";
  static const changeProfilePicture = "/profile/edit-profile";
  static const changeAvailabilityStatus = "/change-availability-status";
  static const getChefProfile = "/profile";
  static const getChefBalance = "/profile/balance";
  static const getOrdersMealsNotes = "/profile/notes";
  static const editDeliverMealTime = "/profile/edit-deliver-meal-time";
  static const editMaxMealPerDay = "/profile/edit-max-meal";
  static const sendCode = "/send-code";
  static const checkCodeAndAccessibility = "/check-code-and-accessibility";
  static const requestRegister = "/request-register";

  static String getOrderHistory(int page) =>
      "/profile/order-history?page=$page";

  static String timeOrders(String time) => "/orders/?time=$time";

  static String changeOrderStatus(int orderId) =>
      "/orders/$orderId/change-status";

  static String getCategoryMeals(int categoryId) =>
      "/meals/categories/$categoryId";

  static String getFinalPrice(int price) => "/meals/meal/$price";

  static String changeMealAvailability(int mealId) =>
      "/meals/$mealId/edit-availability";

  static String decreaseMaxMealNumber(int mealId) =>
      "/meals/$mealId/subtract-portion";

  static String deleteMeal(int mealId) => "/meals/$mealId/";

  static String deleteSubscription(int id) => "/subscriptions/$id";

  static String editSubscriptionAvailability(int id) =>
      "/subscriptions/$id/edit-availability";

  static String editMeal(int mealId) => "/meals/$mealId?_method=PUT";

  static String editSubscription(int id) => "/subscriptions/$id";

  static String increaseMaxMealNumber(int mealId) =>
      "/meals/$mealId/add-portion";
}

class SharedPreferencesKeys {
  static String userId = 'user_id';
  static String apiToken = 'token';
  static String userName = 'user_name';
  static String userEmail = 'user_email';
  static String userPhoneNumber = 'user_phone_number';
  static String userCampusCardExpiryDate = 'user_campus_card_expiry_date';
}

class ErrorMessage {
  static String error400 = 'الطلب الذي تم إرساله غير صالح';
  static String error401 = 'فشلت عملية المصادقة مع الخادم';
  static String error403 = 'لا يوجد لديك إذن للقيام بهذه العملية';
  static String error404 = 'المورد المطلوب غير موجود';
  static String error422 = 'االبيانات المدخلة غير صحيحة';
  static String error500 = 'حدث خطأ ما في عملية التواصل مع الخادم';
  static String error503 = 'الخدمة المطلوب غير متوفرة حالياً';
  static String someThingWentWrong = 'حدث خطأ ما';
  static String nullData = 'لايوجد بيانات لعرضها';
}

final option = Options(
  headers: {
    'Accept': 'application/json',
  },
);

final baseOptions = BaseOptions(
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
        'image': await MultipartFile.fromFile(
          params.pickedImage!.path,
          filename: params.pickedImage!.name,
        ),
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

  static String addSubscription({
    required NewSubscription newSubscription,
  }) {
    final form = json.encode({
      'name': newSubscription.name,
      'days_number': newSubscription.daysNumber,
      'meals': [...newSubscription.mealsIds],
      'starts_at': newSubscription.startsAt,
      'meal_delivery_time': newSubscription.mealDeliveryTime,
      'max_subscribers': newSubscription.maxSubscribers,
      'meals_cost': newSubscription.mealsCost,
    });
    print(form);
    return form;
  }

  // Send Code
  static FormData sendCode({required String phoneNumber}) {
    return FormData.fromMap({
      'phone_number': phoneNumber,
    });
  }

  // Check Code
  static FormData checkCode({
    required String phoneNumber,
    required String code,
    required String fcmToken,
  }) {
    return FormData.fromMap({
      'phone_number': phoneNumber,
      'code': code,
      'fcm_token': fcmToken,
    });
  }

  // Request Register
  static FormData requestRegister({
    required RegisterRequestModel request,
    required String fcmToken,
  }) {
    if (request.certificatePath != null) {
      return FormData.fromMap({
        'phone_number': request.phoneNumber,
        'birth_date': request.birthDate,
        'name': request.name,
        'email': request.email,
        'location': request.location,
        'gender': request.gender.index,
        'latitude': request.latitude,
        'longitude': request.longitude,
        'delivery_starts_at': request.deliveryStartsAt,
        'delivery_ends_at': request.deliveryEndsAt,
        'max_meals_per_day': request.maxMealsPerDay,
        // 'profile_picture': request.profilePicture,
        'certificate': MultipartFile.fromFile(request.certificatePath!,
            filename: request.certificateName),
        'fcm_token': fcmToken,
      });
    } else {
      return FormData.fromMap({
        'phone_number': request.phoneNumber,
        'birth_date': request.birthDate,
        'name': request.name,
        'email': request.email,
        'location': request.location,
        'gender': request.gender.index,
        'latitude': request.latitude,
        'longitude': request.longitude,
        'delivery_starts_at': request.deliveryStartsAt,
        'delivery_ends_at': request.deliveryEndsAt,
        'max_meals_per_day': request.maxMealsPerDay,
        // 'profile_picture': request.profilePicture,
        'fcm_token': fcmToken,
      });
    }
  }

  // Change profile picture
  static FormData changeProfilePicture({required XFile image}) {
    return FormData.fromMap(
      {
        'profile_picture': MultipartFile.fromFile(
          image.path,
          filename: image.name,
        ),
      },
    );
  }

  // Edit max meals per day
  static FormData editMaxMealsPerDay({
    required int maxMealsPerDay,
  }) {
    return FormData.fromMap(
      {
        'max_meals_per_day': maxMealsPerDay,
      },
    );
  }

  // Edit deliver meal time
  static FormData editDeliverMealTime({
    required String deliveryStartsAt,
    required String deliveryEndsAt,
  }) {
    return FormData.fromMap(
      {
        'delivery_starts_at': deliveryStartsAt,
        'delivery_ends_at': deliveryEndsAt,
      },
    );
  }
}

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String? token, {int isPagination = 0}) {
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': ' Bearer $token',
        // 'encrypt' : 'multiport/form-data',
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

void message({
  required String message,
  required bool isError,
  required BuildContext context,
  required bloc,
}) {
  // For debug only
  debugPrint('Message is "$message"');
  debugPrint(bloc.state.toString());
  if (message.isNotEmpty) {
    if (isError) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.withOpacity(1.0),
        textColor: Colors.white,
        fontSize: 16.0.sp,
      );
    } else {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        textColor: Colors.white,
        fontSize: 16.0.sp,
      );
    }
    bloc.clearMessage();
  }
}
