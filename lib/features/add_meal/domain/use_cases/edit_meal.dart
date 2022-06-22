import 'package:beitouti_chefs/features/add_meal/domain/repositories/add_meal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class EditMealUseCase implements UseCase<void, EditMealUseCaseParams> {
  final AddMealRepository _repository;

  EditMealUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(EditMealUseCaseParams params)async {
    return await _repository.editMeal(params);
  }
}

class EditMealUseCaseParams extends Equatable {
  final int mealId;
  final XFile? pickedImage;
  final String name;
  final int categoryId;
  final String ingredients;
  final int preparingTime;
  final int maxMeals;
  final int? price;
  final String? priceEditReason;
  final double? discount;

  const EditMealUseCaseParams({
    required this.mealId,
    required this.pickedImage,
    required this.name,
    required this.categoryId,
    required this.ingredients,
    required this.preparingTime,
    required this.maxMeals,
    required this.price,
    required this.priceEditReason,
    this.discount,
  });

  @override
  List<Object?> get props => [];
}
