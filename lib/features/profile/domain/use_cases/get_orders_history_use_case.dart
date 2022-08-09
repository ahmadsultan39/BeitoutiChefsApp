import 'package:beitouti_chefs/core/entities/paginate_list.dart';
import 'package:beitouti_chefs/core/network/params/paginate_list_params.dart';
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
    implements UseCase<PaginateList<PreparedOrder>, PaginateListParams> {
  final ProfileRepository _repository;

  GetOrdersHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, PaginateList<PreparedOrder>>> call(PaginateListParams params) {
    return _repository.getOrdersHistory(params.page);
  }
}
