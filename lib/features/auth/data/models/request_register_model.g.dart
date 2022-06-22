// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegisterRequestModel(
      certificateName: json['certificateName'] as String?,
      certificatePath: json['certificatePath'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      gender: json['gender'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      phoneNumber: json['phone_number'] as String,
      deliveryEndsAt: json['delivery_ends_at'] as String,
      deliveryStartsAt: json['delivery_starts_at'] as String,
      maxMealsPerDay: json['max_meals_per_day'] as int,
      birthDate: json['birth_date'] as String,
    );

Map<String, dynamic> _$RegisterRequestModelToJson(
        RegisterRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'gender': _$GenderEnumMap[instance.gender],
      'certificateName': instance.certificateName,
      'certificatePath': instance.certificatePath,
      'phone_number': instance.phoneNumber,
      'birth_date': instance.birthDate,
      'delivery_ends_at': instance.deliveryEndsAt,
      'delivery_starts_at': instance.deliveryStartsAt,
      'max_meals_per_day': instance.maxMealsPerDay,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
