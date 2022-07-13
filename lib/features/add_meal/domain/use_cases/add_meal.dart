import 'package:beitouti_chefs/features/add_meal/domain/repositories/add_meal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class AddMealUseCase implements UseCase<void, AddMealUseCaseParams> {
  final AddMealRepository _repository;

  AddMealUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(AddMealUseCaseParams params)async {
    return await _repository.addMeal(params);
  }
}

class AddMealUseCaseParams extends Equatable {
  final XFile pickedImage;
  final String name;
  final int categoryId;
  final String ingredients;
  final int preparingTime;
  final int maxMeals;
  final int price;
  final double? discount;

  const AddMealUseCaseParams({
    required this.pickedImage,
    required this.name,
    required this.categoryId,
    required this.ingredients,
    required this.preparingTime,
    required this.maxMeals,
    required this.price,
    this.discount,
  });

  @override
  List<Object?> get props => [];
}
