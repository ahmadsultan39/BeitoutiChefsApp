import 'package:beitouti_chefs/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class PickImageUseCase implements UseCase<XFile?, NoParams> {
  final ProfileRepository repository;

  PickImageUseCase(this.repository);

  @override
  Future<Either<Failure, XFile?>> call(NoParams params) async {
    return await repository.pickImage();
  }
}
