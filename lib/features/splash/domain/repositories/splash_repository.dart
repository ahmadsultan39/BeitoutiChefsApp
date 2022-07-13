import 'package:dartz/dartz.dart';

import '../../../../core/data/base_repository.dart';
import '../../../../core/error/failures.dart';

abstract class SplashRepository extends BaseRepository {
  Future<Either<Failure, bool>> checkAuth();
}
