import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/accessibility_status.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class CheckCodeUseCase
    implements UseCase<AccessibilityStatus, ParamsCheckCodeUseCase> {
  final AuthRepository _repository;

  CheckCodeUseCase(this._repository);

  @override
  Future<Either<Failure, AccessibilityStatus>> call(
      ParamsCheckCodeUseCase params) {
    return _repository.checkCode(
      code: params.code,
      phoneNumber: params.phoneNumber,
    );
  }
}

class ParamsCheckCodeUseCase extends Equatable {
  final String code;
  final String phoneNumber;

  const ParamsCheckCodeUseCase({
    required this.code,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [code, phoneNumber];
}
