import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:beitouti_chefs/features/add_meal/domain/repositories/add_meal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetFinalPriceUseCase implements UseCase<List<Category>, NoParams> {
  final AddMealRepository _repository;

  GetFinalPriceUseCase(this._repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await _repository.getCategories();
  }
}
