import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/request_register.dart';

part 'request_register_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends RegisterRequest {
  static String className = "RegisterRequestModel";

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'birth_date')
  final String birthDate;

  @JsonKey(name: 'delivery_ends_at')
  final String deliveryEndsAt;

  @JsonKey(name: 'delivery_starts_at')
  final String deliveryStartsAt;

  @JsonKey(name: 'max_meals_per_day')
  final int maxMealsPerDay;

  RegisterRequestModel({
    String? certificateName,
    String? certificatePath,
    required String name,
    required String email,
    required String location,
    required int gender,
    required double latitude,
    required double longitude,
    required this.phoneNumber,
    required this.deliveryEndsAt,
    required this.deliveryStartsAt,
    required this.maxMealsPerDay,
    required this.birthDate,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          birthDate: birthDate,
          gender: Gender.values[gender],
          location: location,
          deliveryEndsAt: deliveryEndsAt,
          deliveryStartsAt: deliveryStartsAt,
          latitude: latitude,
          longitude: longitude,
          maxMealsPerDay: maxMealsPerDay,
          certificateName: certificateName,
          certificatePath: certificatePath,
        );

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
