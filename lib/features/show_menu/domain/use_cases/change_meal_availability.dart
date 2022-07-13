import 'package:beitouti_chefs/features/show_menu/domain/repositories/show_menu.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/meal.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class ChangeMealAvailabilityUseCase
    implements UseCase<void, ChangeMealAvailabilityUseCaseParams> {
  final ShowMenuRepository _repository;

  ChangeMealAvailabilityUseCase(this._repository);

  @override
  Future<Either<Failure,void >> call(
      ChangeMealAvailabilityUseCaseParams params) async {
    return await _repository.changeMealAvailability(params.mealId);
  }
}

class ChangeMealAvailabilityUseCaseParams extends Equatable {
  final int mealId;

  const ChangeMealAvailabilityUseCaseParams({
    required this.mealId,
  });

  @override
  List<Object?> get props => [mealId];
}