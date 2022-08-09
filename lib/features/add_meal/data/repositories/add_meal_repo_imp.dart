import 'package:beitouti_chefs/core/data/base_local_data_source.dart';
import 'package:beitouti_chefs/core/data/base_repository.dart';
import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:beitouti_chefs/core/error/failures.dart';
import 'package:beitouti_chefs/core/network/network_info.dart';
import 'package:beitouti_chefs/features/add_meal/data/data_sources/local/add_meal_local_data_source.dart';
import 'package:beitouti_chefs/features/add_meal/data/data_sources/remote/add_meal_remote_data_source.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/add_meal.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/edit_meal.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/add_meal_repository.dart';

@LazySingleton(as: AddMealRepository)
class AddMealRepoImp extends BaseRepositoryImpl implements AddMealRepository {
  AddMealRepoImp(this._local, this._remote,
      {required BaseLocalDataSource baseLocalDataSource,
      required NetworkInfo networkInfo})
      : super(
            baseLocalDataSource: baseLocalDataSource, networkInfo: networkInfo);
  final AddMealLocalDataSource _local;
  final AddMealRemoteDataSource _remote;

  @override
  Future<Either<Failure, Category>> addCategory(String name) async {
    try {
      final token = await _local.token;
      final result = await _remote.addCategory(token: token, name: name);
      return Right(result);
    } on HandledException catch (e) {
      print("add meal repo error in repo $e");
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> addMeal(AddMealUseCaseParams params) async {
    try {
      final token = await _local.token;
      await _remote.addMeal(token: token, params: params);
      return Right(null);
    } on HandledException catch (e) {
      print("add meal repo error in repo ${e.error}");
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> editMeal(EditMealUseCaseParams params) async {
    try {
      final token = await _local.token;
      await _remote.editMeal(token: token, params: params);
      return Right(null);
    } on HandledException catch (e) {
      print("add meal repo error in repo $e");
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final token = await _local.token;
      final result = await _remote.getCategories(token);
      return Right(result);
    } on HandledException catch (e) {
      print("add meal repo error in repo $e");
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, int>> getFinalPrice(int price) async {
    try {
      final token = await _local.token;
      final result = await _remote.getFinalPrice(token: token, price: price);
      return Right(result);
    } on HandledException catch (e) {
      print("add meal repo error in repo $e");
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, XFile?>> pickImage() async {
    try {
      final result = await _local.pickImage();
      return Right(result);
    } on PickFileException catch (e) {
      print("add meal repo error in repo $e");
      return Left(PickFileFailure());
    }
  }
}
