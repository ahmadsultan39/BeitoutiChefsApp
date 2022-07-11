//TODO extend base repository
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/accessibility_status.dart';
import '../entities/request_register.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> sendCode({
    required String phoneNumber,
  });

  Future<Either<Failure, AccessibilityStatus>> checkCode({
    required String phoneNumber,
    required String code,
  });

  Future<Either<Failure, void>> requestRegister({
    required RegisterRequest request,
  });
}
