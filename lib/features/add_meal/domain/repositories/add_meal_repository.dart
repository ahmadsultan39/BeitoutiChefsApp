import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/add_meal.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/edit_meal.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/base_repository.dart';
import '../../../../core/error/failures.dart';

abstract class AddMealRepository extends BaseRepository
{
  Future<Either<Failure, void>> addMeal(AddMealUseCaseParams params);

  Future<Either<Failure, void>> editMeal(EditMealUseCaseParams params);

  Future<Either<Failure, int>> getFinalPrice(int price);

  Future<Either<Failure, Category>> addCategory(String name);

  Future<Either<Failure, List<Category>>> getCategories();

  Future<Either<Failure, XFile?>> pickImage();

}