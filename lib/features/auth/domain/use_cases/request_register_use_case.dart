import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/request_register.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class RequestRegisterUseCase
    implements UseCase<void, ParamsRequestRegisterUseCase> {
  final AuthRepository _repository;

  RequestRegisterUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsRequestRegisterUseCase params) {
    return _repository.requestRegister(
      request: params.request,
    );
  }
}

class ParamsRequestRegisterUseCase extends Equatable {
  final RegisterRequest request;

  const ParamsRequestRegisterUseCase({
    required this.request,
  });

  @override
  List<Object?> get props => [request];
}
