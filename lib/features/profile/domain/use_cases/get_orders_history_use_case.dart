import 'package:beitouti_chefs/features/profile/domain/entities/prepared_order.dart';
import 'package:beitouti_chefs/features/profile/domain/entities/prepared_order.dart';
import 'package:beitouti_chefs/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetOrdersHistoryUseCase
    implements UseCase<List<PreparedOrder>, NoParams> {
  final ProfileRepository _repository;

  GetOrdersHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<PreparedOrder>>> call(NoParams params) {
    return _repository.getOrdersHistory();
  }
}
