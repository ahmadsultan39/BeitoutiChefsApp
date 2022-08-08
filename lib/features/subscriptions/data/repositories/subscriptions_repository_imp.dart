import 'package:beitouti_chefs/core/data/base_repository.dart';
import 'package:beitouti_chefs/core/error/failures.dart';
import 'package:beitouti_chefs/features/subscriptions/data/data_sources/local/subscriptions_local_data_source.dart';
import 'package:beitouti_chefs/features/subscriptions/data/data_sources/remote/subscriptions_remote_data_source.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/add_subscription_meal.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/new_subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/repositories/subscriptions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

@LazySingleton(as: SubscriptionsRepository)
class SubscriptionsRepositoryImp extends BaseRepositoryImpl
    implements SubscriptionsRepository {
  SubscriptionsLocalDataSource _local;
  final SubscriptionsRemoteDataSource _remote;

  SubscriptionsRepositoryImp(
    this._remote,
    this._local, {
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: _local,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, List<Subscription>>> getSubscriptions() async {
    try {
      final _token = await _local.token;
      final result = await _remote.getSubscriptions(
        token: _token,
      );
      return Right(result);
    } on ImplementedError catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSubscription({required int id}) async {
    try {
      final _token =await _local.token;
      await _remote.deleteSubscription(
        token: _token,
        id: id,
      );
      return Right(null);
    } on ImplementedError catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, String>> editSubscriptionAvailability(
      {required int id}) async {
    try {
      final _token = await _local.token;
      final result = await _remote.editSubscriptionAvailability(
        token: _token,
        id: id,
      );
      return Right(result);
    } on ImplementedError catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, String>> addNewSubscription(
      {required NewSubscription newSubscription}) async {
    try {
      final _token = await _local.token;
      final result = await _remote.addNewSubscription(
        token: _token,
        newSubscription: newSubscription,
      );
      return Right(result);
    } on ImplementedError catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, String>> editSubscription(
      {required NewSubscription newSubscription}) async {
    try {
      final _token = await _local.token;
      final result = await _remote.editSubscription(
        token: _token,
        newSubscription: newSubscription,
      );
      return Right(result);
    } on ImplementedError catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, List<AddSubscriptionMeal>>> getChefMeals() async {
    try {
      final _token = await _local.token;
      final result = await _remote.getChefMeals(
        token: _token,
      );
      return Right(result);
    } on ImplementedError catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }
}
