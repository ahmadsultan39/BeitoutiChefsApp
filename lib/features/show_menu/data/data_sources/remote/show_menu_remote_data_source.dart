import '../../../../../core/data/base_remote_datasource.dart';
import '../../../../../core/models/category_model.dart';
import '../../../../../core/models/meal_model.dart';
import '../../models/meals_info_model.dart';

abstract class ShowMenuRemoteDataSource extends BaseRemoteDataSource
{
  Future<List<CategoryModel>> getCategories({required String token});

  Future<List<MealModel>> getCategoryMeals({required String token,required int categoryId});

  Future<MealsInfoModel> getActiveMealsCount({required String token});

  Future<void> changeMealAvailability({required String token,required int mealId});

  Future<void> decreaseMaxMealNumber({required String token,required int mealId});

  Future<void> deleteMeal({required String token,required int mealId});

  Future<void> increaseMaxMealNumber({required String token,required int mealId});
}