import 'package:beitouti_chefs/features/show_menu/domain/repositories/show_menu.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class DecreaseMaxMealNumberUseCase
    implements UseCase<void, DecreaseMaxMealNumberUseCaseParams> {
  final ShowMenuRepository _repository;

  DecreaseMaxMealNumberUseCase(this._repository);

  @override
  Future<Either<Failure,void >> call(
      DecreaseMaxMealNumberUseCaseParams params) async {
    return await _repository.decreaseMaxMealNumber(params.mealId);
  }
}

class DecreaseMaxMealNumberUseCaseParams extends Equatable {
  final int mealId;

  const DecreaseMaxMealNumberUseCaseParams({
    required this.mealId,
  });

  @override
  List<Object?> get props => [mealId];
}