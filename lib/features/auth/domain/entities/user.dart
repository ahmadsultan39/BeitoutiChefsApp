import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String phoneNumber;
  final String name;
  final String email;
  final String accessToken;

  const User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.accessToken,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        accessToken,
      ];
}
