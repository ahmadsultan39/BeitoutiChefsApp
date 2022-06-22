import 'package:beitouti_chefs/features/add_meal/domain/repositories/add_meal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class PickImageUseCase implements UseCase<XFile?, NoParams> {
  final AddMealRepository addMealRepository;

  PickImageUseCase(this.addMealRepository);

  @override
  Future<Either<Failure, XFile?>> call(NoParams params) async {
    return await addMealRepository.pickImage();
  }
}
