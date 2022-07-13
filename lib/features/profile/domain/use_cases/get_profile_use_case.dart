import 'package:beitouti_chefs/features/profile/domain/entities/profile.dart';
import 'package:beitouti_chefs/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetProfileUseCase implements UseCase<Profile, NoParams> {
  final ProfileRepository _repository;

  GetProfileUseCase(this._repository);

  @override
  Future<Either<Failure, Profile>> call(NoParams params) {
    return _repository.getChefProfile();
  }
}
