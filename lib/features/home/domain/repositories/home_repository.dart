import 'package:dartz/dartz.dart';

import '../../../../core/data/base_repository.dart';
import '../../../../core/error/failures.dart';

abstract class HomeRepository extends BaseRepository {
  Future<Either<Failure, void>> changeAvailability(bool currentStatus);

  Future<Either<Failure, bool>> getAvailabilityStatus();
}
