import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/base_repository.dart';
import '../../../../core/entities/meal.dart';
import '../../../../core/error/failures.dart';
import '../entities/meals_info.dart';

abstract class ShowMenuRepository extends BaseRepository
{
  Future<Either<Failure, List<Category>>> getCategories();

  Future<Either<Failure, List<Meal>>> getCategoryMeals(int categoryId);

  Future<Either<Failure, MealsInfo>> getActiveMealsCount();

  Future<Either<Failure, void>> changeMealAvailability(int mealId);

  Future<Either<Failure, void>> increaseMaxMealNumber(int mealId);

  Future<Either<Failure, void>> decreaseMaxMealNumber(int mealId);

  Future<Either<Failure, void>> deleteMeal(int mealId);
}