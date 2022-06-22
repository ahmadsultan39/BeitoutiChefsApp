import 'package:beitouti_chefs/features/add_meal/domain/repositories/add_meal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/category.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class AddCategoryUseCase implements UseCase<Category, AddCategoryUseCaseParams> {
  final AddMealRepository _repository;

  AddCategoryUseCase(this._repository);

  @override
  Future<Either<Failure, Category>> call(AddCategoryUseCaseParams params) async {
    return await _repository.addCategory(params.name);
  }
}

class AddCategoryUseCaseParams extends Equatable {
  final String name;

  const AddCategoryUseCaseParams({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}
