import 'package:beitouti_chefs/features/profile/domain/entities/chef_balance.dart';
import 'package:beitouti_chefs/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetChefBalanceUseCase implements UseCase<ChefBalance, NoParams> {
  final ProfileRepository _repository;

  GetChefBalanceUseCase(this._repository);

  @override
  Future<Either<Failure, ChefBalance>> call(NoParams params) {
    return _repository.getChefBalance();
  }
}
