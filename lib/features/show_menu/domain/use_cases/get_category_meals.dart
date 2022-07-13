import 'package:beitouti_chefs/features/show_menu/domain/repositories/show_menu.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/meal.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
@lazySingleton
class GetCategoryMealsUseCase
    implements UseCase<List<Meal>, GetCategoryMealsUseCaseParams> {
  final ShowMenuRepository _repository;

  GetCategoryMealsUseCase(this._repository);

  @override
  Future<Either<Failure,List<Meal> >> call(
      GetCategoryMealsUseCaseParams params) async {
    return await _repository.getCategoryMeals(params.categoryId);
  }
}

class GetCategoryMealsUseCaseParams extends Equatable {
  final int categoryId;

  const GetCategoryMealsUseCaseParams({
    required this.categoryId,
  });

  @override
  List<Object?> get props => [categoryId];
}