import 'package:beitouti_chefs/features/add_meal/domain/repositories/add_meal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class GetFinalPriceUseCase implements UseCase<int, GetFinalPriceUseCaseParams> {
  final AddMealRepository _repository;

  GetFinalPriceUseCase(this._repository);

  @override
  Future<Either<Failure, int>> call(GetFinalPriceUseCaseParams params) async {
    return await _repository.getFinalPrice(params.price);
  }
}

class GetFinalPriceUseCaseParams extends Equatable {
  final int price;

  const GetFinalPriceUseCaseParams({
    required this.price,
  });

  @override
  List<Object?> get props => [price];
}
