import 'package:beitouti_chefs/features/show_menu/domain/repositories/show_menu.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/meal.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class IncreaseMaxMealNumberUseCase
    implements UseCase<void, IncreaseMaxMealNumberUseCaseParams> {
  final ShowMenuRepository _repository;

  IncreaseMaxMealNumberUseCase(this._repository);

  @override
  Future<Either<Failure,void >> call(
      IncreaseMaxMealNumberUseCaseParams params) async {
    return await _repository.increaseMaxMealNumber(params.mealId);
  }
}

class IncreaseMaxMealNumberUseCaseParams extends Equatable {
  final int mealId;

  const IncreaseMaxMealNumberUseCaseParams({
    required this.mealId,
  });

  @override
  List<Object?> get props => [mealId];
}