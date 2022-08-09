import 'package:beitouti_chefs/core/entities/meal.dart';
import 'package:beitouti_chefs/core/util/constants.dart';
import 'package:beitouti_chefs/features/show_menu/data/data_sources/local/show_menu_local_data_source.dart';
import 'package:beitouti_chefs/features/show_menu/data/data_sources/remote/show_menu_remote_data_source.dart';
import 'package:beitouti_chefs/features/show_menu/domain/repositories/show_menu.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/base_repository.dart';
import '../../../../core/entities/category.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/meals_info.dart';

@LazySingleton(as: ShowMenuRepository)
class ShowMenuRepositoryImp extends BaseRepositoryImpl
    implements ShowMenuRepository {
  final ShowMenuRemoteDataSource _http;
  final ShowMenuLocalDataSource _local;

  ShowMenuRepositoryImp(
    this._http,
    this._local, {
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: _local,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final token = await _local.token;
      final result = await _http.getCategories(
        token: token,
      );
      return Right(
        result,
      );
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    } catch (e) {
      return Left(ServerFailure(error: ErrorMessage.someThingWentWrong));

    }
  }

  @override
  Future<Either<Failure, MealsInfo>> getActiveMealsCount() async {
    try {
      final token = await _local.token;
      final result = await _http.getActiveMealsCount(
        token: token,
      );
      return Right(
        result,
      );
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    } catch (e) {
      return Left(ServerFailure(error: ErrorMessage.someThingWentWrong));

    }
  }

  @override
  Future<Either<Failure, List<Meal>>> getCategoryMeals(int categoryId) async {
    try {
      final token = await _local.token;
      final result = await _http.getCategoryMeals(
        token: token,
        categoryId: categoryId,
      );
      return Right(
        result,
      );
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    } catch (e) {
      return Left(ServerFailure(error: ErrorMessage.someThingWentWrong));

    }
  }

  @override
  Future<Either<Failure, void>> changeMealAvailability(int mealId) async {
    try {
      final token = await _local.token;
      final result = await _http.changeMealAvailability(
        token: token,
        mealId: mealId,
      );
      return Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    } catch (e) {
      return Left(ServerFailure(error: ErrorMessage.someThingWentWrong));

    }
  }

  @override
  Future<Either<Failure, void>> decreaseMaxMealNumber(int mealId) async {
    try {
      final token = await _local.token;
      final result = await _http.decreaseMaxMealNumber(
        token: token,
        mealId: mealId,
      );
      return Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    } catch (e) {
      return Left(ServerFailure(error: ErrorMessage.someThingWentWrong));

    }
  }

  @override
  Future<Either<Failure, void>> deleteMeal(int mealId) async {
    try {
      final token = await _local.token;
      final result = await _http.deleteMeal(
        token: token,
        mealId: mealId,
      );
      return Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    } catch (e) {
  return Left(ServerFailure(error: ErrorMessage.someThingWentWrong));
    }
  }

  @override
  Future<Either<Failure, void>> increaseMaxMealNumber(int mealId) async {
    try {
      final token = await _local.token;
      final result = await _http.increaseMaxMealNumber(
        token: token,
        mealId: mealId,
      );
      return Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    } catch (e) {
      return Left(ServerFailure(error: ErrorMessage.someThingWentWrong));

    }
  }
}
