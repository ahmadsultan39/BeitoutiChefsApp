import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import 'base_local_data_source.dart';
import '../network/network_info.dart';

typedef FutureEitherOr<T> = Future<Either<Failure, T>> Function();
typedef FutureEitherOrWithToken<T> = Future<Either<Failure, T>> Function(
    String token);

abstract class BaseRepository {
  Future<Either<Failure, String>> getToken();

  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body);

  Future<Either<Failure, T>> requestWithToken<T>(
      FutureEitherOrWithToken<T> body);
}

@LazySingleton(as: BaseRepository)
class BaseRepositoryImpl implements BaseRepository {
  final BaseLocalDataSource baseLocalDataSource;
  final NetworkInfo networkInfo;

  BaseRepositoryImpl({
    required this.baseLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> getToken() async {
    final token = await baseLocalDataSource.token;
    debugPrint('token is $token');
    if (token.isNotEmpty) {
      return Right(token);
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, T>> requestWithToken<T>(
    FutureEitherOrWithToken<T> body,
  ) async {
    debugPrint('requestWithToken');
    return await checkNetwork<T>(() async {
      try {
        final token = await getToken();
        print('token is $token');
        return await token.fold(
          (failure) => const Left(ServerFailure()),
          (token) async {
            return body(token);
          },
        );
      } catch (e) {
        debugPrint('e is $e');
        if (e is ServerException) {
          return Left(ServerFailure(error: e.error));
        } else {
          return Left(ServerFailure(error: "Test is test"));
        }
      }
    });
  }

  @override
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body) async {
    if (await networkInfo.isConnected) {
      return body();
    } else {
      return Left(ServerFailure());
    }
  }
}
