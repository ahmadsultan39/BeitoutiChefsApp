import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Profile extends Equatable {
  final String name;

  final String email;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'location_name')
  final String locationName;

  @JsonKey(name: 'profile_picture')
  final String? profilePicture;

  @JsonKey(name: 'max_meals_per_day')
  final int maxMealsPerDay;

  @JsonKey(name: 'delivery_ends_at')
  final String deliveryEndsAt;

  @JsonKey(name: 'delivery_starts_at')
  final String deliveryStartsAt;

  @JsonKey(name: 'is_available')
  final bool isAvailable;

  const Profile({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.maxMealsPerDay,
    required this.locationName,
    required this.profilePicture,
    required this.deliveryEndsAt,
    required this.deliveryStartsAt,
    required this.isAvailable,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        profilePicture,
        locationName,
        deliveryEndsAt,
        deliveryStartsAt,
        isAvailable,
      ];
}
