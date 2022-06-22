// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessibility_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessibilityStatusModel _$AccessibilityStatusModelFromJson(
        Map<String, dynamic> json) =>
    AccessibilityStatusModel(
      accessibilityStatus: json['status'] as int,
      userModel: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccessibilityStatusModelToJson(
        AccessibilityStatusModel instance) =>
    <String, dynamic>{
      'user': instance.userModel,
      'status': instance.accessibilityStatus,
    };
