import 'package:beitouti_chefs/core/data/base_remote_datasource.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/add_meal.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/edit_meal.dart';

import '../../../../../core/models/category_model.dart';

abstract class AddMealRemoteDataSource extends BaseRemoteDataSource {
  Future<List<CategoryModel>> getCategories(String token);

  Future<CategoryModel> addCategory({required String token,required String name});

  Future<void> addMeal({required String token,required AddMealUseCaseParams params});

  Future<void> editMeal({required String token,required EditMealUseCaseParams params});

  Future<int> getFinalPrice({required String token,required int price});
}