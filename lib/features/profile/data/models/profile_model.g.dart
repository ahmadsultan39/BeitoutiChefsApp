// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      locationName: json['location_name'] as String,
      profilePicture: json['profile_picture'] as String,
      deliveryEndsAt: json['delivery_ends_at'] as String,
      deliveryStartsAt: json['delivery_starts_at'] as String,
      maxMealsPerDay: json['max_meals_per_day'] as int,
      isAvailable: json['is_available'] as bool,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'location_name': instance.locationName,
      'profile_picture': instance.profilePicture,
      'max_meals_per_day': instance.maxMealsPerDay,
      'delivery_ends_at': instance.deliveryEndsAt,
      'delivery_starts_at': instance.deliveryStartsAt,
      'is_available': instance.isAvailable,
    };
