library base_list_response_model;

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../features/orders/data/models/order_meal_model.dart';
import '../../../features/orders/data/models/orders_times_model.dart';
import '../../../features/orders/data/models/time_order_model.dart';
import '../../../features/orders/data/models/total_meal_model.dart';
import '../../../features/subscriptions/data/models/add_subscription_meal_model.dart';
import '../../../features/subscriptions/data/models/subscription_model.dart';
import '../../models/category_model.dart';
import '../../models/meal_model.dart';

part 'base_list_response_model.g.dart';

@JsonSerializable()
class BaseListResponseModel<T> {
  @JsonKey(name: 'errors')
  final String? error;

  @JsonKey(name: 'data')
  @_Converter()
  final List<T>? data;

  BaseListResponseModel({this.error, this.data});

  factory BaseListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseListResponseModelFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    debugPrint('t is ${T.toString()}');
    if (json is Map<String, dynamic> && T.toString() == MealModel.className) {
      return MealModel.fromJson(json) as T;
    } else if (json is Map<String, dynamic> &&
        T.toString() == CategoryModel.className) {
      return CategoryModel.fromJson(json) as T;
    } else if (json is Map<String, dynamic> &&
        T.toString() == OrdersTimesModel.className) {
      return OrdersTimesModel.fromJson(json) as T;
    } else if (json is Map<String, dynamic> &&
        T.toString() == TotalMealModel.className) {
      return TotalMealModel.fromJson(json) as T;
    } else if (json is Map<String, dynamic> &&
        T.toString() == TimeOrderModel.className) {
      return TimeOrderModel.fromJson(json) as T;
    } else if (json is Map<String, dynamic> &&
        T.toString() == OrderMealModel.className) {
      return OrderMealModel.fromJson(json) as T;
    } else if (json is Map<String, dynamic> &&
        T.toString() == SubscriptionModel.className) {
      return SubscriptionModel.fromJson(json) as T;
    } else if (json is Map<String, dynamic> &&
        T.toString() == AddSubscriptionMealModel.className) {
      return AddSubscriptionMealModel.fromJson(json) as T;
    }

    throw Exception('parse error');
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object!;
  }
}
