library base_response_model;

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../features/auth/data/models/accessibility_status_model.dart';
import '../../../features/auth/data/models/user_model.dart';

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

T? _dataFromJson<T>(Object data) {
  debugPrint("T is: ${T.toString()}");
  if (data is List<dynamic>) {
    return null;
  }
  else if (T.toString() == AccessibilityStatusModel.className) {
    return AccessibilityStatusModel.fromJson(data as Map<String, dynamic>) as T;
  } else if (T.toString() == UserModel.className) {
    return UserModel.fromJson(data as Map<String, dynamic>) as T;
  } else if (T.toString() == 'Null') {
    debugPrint('Null Data');
    return null;
  }
  throw Exception('parse error');
}

Map<String, dynamic> _dataToJson<T, S, U>(T input, [S? other1, U? other2]) =>
    {'data': input};
