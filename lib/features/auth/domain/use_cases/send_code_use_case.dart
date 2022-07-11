import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SendCodeUseCase implements UseCase<void, ParamsSendCodeUseCase> {
  final AuthRepository _repository;

  SendCodeUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsSendCodeUseCase params) {
    return _repository.sendCode(
      phoneNumber: params.phoneNumber,
    );
  }
}

class ParamsSendCodeUseCase extends Equatable {
  final String phoneNumber;

  const ParamsSendCodeUseCase({
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [phoneNumber];
}
