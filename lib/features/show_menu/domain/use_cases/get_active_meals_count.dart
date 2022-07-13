import 'package:beitouti_chefs/features/show_menu/domain/entities/meals_info.dart';
import 'package:beitouti_chefs/features/show_menu/domain/repositories/show_menu.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetActiveMealsUseCase
    implements UseCase<MealsInfo, NoParams> {
  final ShowMenuRepository _repository;

  GetActiveMealsUseCase(this._repository);

  @override
  Future<Either<Failure, MealsInfo>> call(NoParams params) async {
    return await _repository.getActiveMealsCount();
  }
}