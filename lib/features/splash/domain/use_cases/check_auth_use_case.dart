import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/splash_repository.dart';

@lazySingleton
class CheckAuthUseCase implements UseCase<bool, NoParams> {
  final SplashRepository _repository;

  CheckAuthUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _repository.checkAuth();
  }
}
