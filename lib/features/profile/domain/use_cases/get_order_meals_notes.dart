import 'package:beitouti_chefs/features/profile/domain/entities/order_meal_note.dart';
import 'package:beitouti_chefs/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetOrderMealsNotesUseCase
    implements UseCase<List<OrderMealNote>, NoParams> {
  final ProfileRepository _repository;

  GetOrderMealsNotesUseCase(this._repository);

  @override
  Future<Either<Failure, List<OrderMealNote>>> call(NoParams params) {
    return _repository.getOrderMealsNotes();
  }
}
