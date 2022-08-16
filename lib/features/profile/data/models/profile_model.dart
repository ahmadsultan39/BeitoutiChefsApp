import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/profile.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Profile {
  static const String className = 'ProfileModel';

  const ProfileModel({
    required String name,
    required String email,
    required String phoneNumber,
    required String locationName,
    required String? profilePicture,
    required String deliveryEndsAt,
    required String deliveryStartsAt,
    required int maxMealsPerDay,
    required bool isAvailable,
  }) : super(
          name: name,
          maxMealsPerDay: maxMealsPerDay,
          email: email,
          phoneNumber: phoneNumber,
          locationName: locationName,
          profilePicture: profilePicture,
          deliveryEndsAt: deliveryEndsAt,
          deliveryStartsAt: deliveryStartsAt,
          isAvailable: isAvailable,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
