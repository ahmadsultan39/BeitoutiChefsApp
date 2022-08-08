import 'package:beitouti_chefs/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class ChangeAvailabilityUseCase implements UseCase<void, NoParams> {
  final HomeRepository _repository;

  ChangeAvailabilityUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _repository.changeAvailability();
  }
}
