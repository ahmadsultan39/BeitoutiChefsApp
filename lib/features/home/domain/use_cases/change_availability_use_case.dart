import 'package:beitouti_chefs/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class ChangeAvailabilityUseCase
    implements UseCase<void, ParamsChangeAvailabilityStatus> {
  final HomeRepository _repository;

  ChangeAvailabilityUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(
      ParamsChangeAvailabilityStatus params) async {
    return await _repository.changeAvailability(
      params.currentStatus,
    );
  }
}

class ParamsChangeAvailabilityStatus extends Equatable {
  final bool currentStatus;

  const ParamsChangeAvailabilityStatus(this.currentStatus);

  @override
  List<Object?> get props => [currentStatus];
}
