library base_response_model;

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../features/show_menu/data/models/meals_info_model.dart';
import '../../models/category_model.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel<T> {
  // @JsonKey(name: 'status')
  // final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data', fromJson: _dataFromJson, toJson: _dataToJson)
  final T? data;

  BaseResponseModel({
    // this.status,
    this.message,
    this.data,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson<T>(json);
  }
}

T? _dataFromJson<T>(Object data) {
  if (data is List<dynamic> && data.isEmpty) {
    return null;
  } else if (data is Map<String, dynamic>) {
    if (T.toString() == CategoryModel.className) {
      return CategoryModel.fromJson(data) as T;
    }else if (T.toString() == MealsInfoModel.className) {
      return MealsInfoModel.fromJson(data) as T;
    }else if (T.toString() == 'Null') {
      debugPrint('Null Data');
      return null;
    }
  }

  throw Exception('parse error');
}

Map<String, dynamic> _dataToJson<T, S, U>(T input, [S? other1, U? other2]) =>
    {'data': input};
