import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/base_local_datasource.dart';
import '../../../../core/data/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/splash_repository.dart';
import '../data_sources/local/splash_local_data_source.dart';
import '../data_sources/remote/splash_remote_data_source.dart';

@LazySingleton(as: SplashRepository)
class SplashRepositoryImp extends BaseRepositoryImpl
    implements SplashRepository {
  final SplashLocalDataSource _local;
  final SplashRemoteDataSource _http;

  SplashRepositoryImp(
    this._local,
    this._http, {
    required BaseLocalDataSource baseLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: _local,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, bool>> checkAuth() async {
    try {
      final String token = await _local.token;
      return Right(token.isNotEmpty);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }
}
