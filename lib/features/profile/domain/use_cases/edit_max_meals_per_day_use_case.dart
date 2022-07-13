import 'package:beitouti_chefs/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class EditMaxMealsPerDayUseCase
    implements UseCase<void, ParamsEditMaxMealsPerDayUseCase> {
  final ProfileRepository _repository;

  EditMaxMealsPerDayUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsEditMaxMealsPerDayUseCase params) {
    return _repository.editMaxMealsPerDay(
      maxMealsPerDay: params.maxMealsPerDay,
    );
  }
}

class ParamsEditMaxMealsPerDayUseCase extends Equatable {
  final int maxMealsPerDay;

  const ParamsEditMaxMealsPerDayUseCase({
    required this.maxMealsPerDay,
  });

  @override
  List<Object?> get props => [maxMealsPerDay];
}
