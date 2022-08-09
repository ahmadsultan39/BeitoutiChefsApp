library base_response_model;

import 'package:beitouti_chefs/core/network/models/paginate_response_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/balance_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/chef_balance_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/prepared_order_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../features/auth/data/models/user_model.dart';
import '../../../features/orders/data/models/order_meal_model.dart';
import '../../../features/orders/data/models/time_order_model.dart';
import '../../../features/orders/data/models/total_meal_model.dart';
import '../../../features/show_menu/data/models/meals_info_model.dart';
import '../../models/category_model.dart';
import '../../../features/auth/data/models/accessibility_status_model.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel<T> {
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'errors')
  final String? errors;
  @JsonKey(name: 'data', fromJson: _dataFromJson, toJson: _dataToJson)
  final T? data;

  BaseResponseModel({this.errors, this.status, this.data});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson<T>(json);
  }
}

T? _dataFromJson<T>(Object? data) {
  debugPrint("T is: ${T.toString()}");
  if (data is List<dynamic> && data.isEmpty) {
    return null;
  } else if (T.toString() == AccessibilityStatusModel.className) {
    return AccessibilityStatusModel.fromJson(data as Map<String, dynamic>) as T;
  } else if (T.toString() == 'Null') {
    debugPrint('Null Data');
    return null;
  } else if (T.toString() == UserModel.className) {
    return UserModel.fromJson(data as Map<String, dynamic>) as T;
  } else if (data is Map<String, dynamic>) {
    if (T.toString() == CategoryModel.className) {
      return CategoryModel.fromJson(data) as T;
    } else if (T.toString() == MealsInfoModel.className) {
      return MealsInfoModel.fromJson(data) as T;
    } else if (T.toString() == TotalMealModel.className) {
      return TotalMealModel.fromJson(data) as T;
    } else if (T.toString() == TimeOrderModel.className) {
      return TimeOrderModel.fromJson(data) as T;
    } else if (T.toString() == OrderMealModel.className) {
      return OrderMealModel.fromJson(data) as T;
    } else if (T.toString() == ProfileModel.className) {
      return ProfileModel.fromJson(data) as T;
    } else if (T.toString() == ChefBalanceModel.className) {
      return ChefBalanceModel.fromJson(data) as T;
    } else if (T.toString() == BalanceModel.className) {
      return BalanceModel.fromJson(data) as T;
    } else if (T.toString() == PreparedOrderModel.paginateName) {
      return PaginateResponseModel<PreparedOrderModel>.fromJson(data) as T;
    } else if (T.toString() == 'Null') {
      debugPrint('Null Data');
      return null;
    }
    throw Exception('parse error');
  }
  return null;
}

Map<String, dynamic> _dataToJson<T, S, U>(T input, [S? other1, U? other2]) =>
    {'data': input};
