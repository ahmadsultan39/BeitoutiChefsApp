import 'package:beitouti_chefs/features/show_menu/domain/repositories/show_menu.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class DeleteMealUseCase
    implements UseCase<void, DeleteMealUseCaseParams> {
  final ShowMenuRepository _repository;

  DeleteMealUseCase(this._repository);

  @override
  Future<Either<Failure,void >> call(
      DeleteMealUseCaseParams params) async {
    return await _repository.deleteMeal(params.mealId);
  }
}

class DeleteMealUseCaseParams extends Equatable {
  final int mealId;

  const DeleteMealUseCaseParams({
    required this.mealId,
  });

  @override
  List<Object?> get props => [mealId];
}