import 'package:beitouti_chefs/features/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/util/enums.dart';

class AccessibilityStatus extends Equatable {
  final AccessibilityStaysType status;
  final User? user;

  const AccessibilityStatus({
    required this.status,
    required this.user,
  });

  @override
  List<Object?> get props => [status, user];
}
