import 'package:beitouti_chefs/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class EditDeliverTimeUseCase
    implements UseCase<void, ParamsEditDeliverTimeUseCase> {
  final ProfileRepository _repository;

  EditDeliverTimeUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsEditDeliverTimeUseCase params) {
    return _repository.editDeliverMealTime(
      endsAt: params.endsAt,
      startsAt: params.startsAt,
    );
  }
}

class ParamsEditDeliverTimeUseCase extends Equatable {
  final String startsAt;
  final String endsAt;

  const ParamsEditDeliverTimeUseCase({
    required this.startsAt,
    required this.endsAt,
  });

  @override
  List<Object?> get props => [startsAt, endsAt];
}
