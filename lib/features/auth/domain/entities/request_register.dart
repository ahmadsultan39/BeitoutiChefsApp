import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/util/enums.dart';

class RegisterRequest extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String birthDate;
  final String deliveryStartsAt;
  final String deliveryEndsAt;
  final String location;
  final double latitude;
  final double longitude;
  final int maxMealsPerDay;
  final Gender gender;
  final String? certificateName;
  final String? certificatePath;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.location,
    required this.gender,
    required this.deliveryEndsAt,
    required this.deliveryStartsAt,
    required this.latitude,
    required this.longitude,
    required this.maxMealsPerDay,
    this.certificateName,
    this.certificatePath,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        birthDate,
        location,
        gender,
      ];
}
