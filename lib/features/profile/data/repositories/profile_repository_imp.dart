import 'package:beitouti_chefs/core/error/exceptions.dart';
import 'package:beitouti_chefs/core/error/failures.dart';
import 'package:beitouti_chefs/features/profile/data/models/chef_balance_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/order_meal_note_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/prepared_order_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/profile_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/base_local_data_source.dart';
import '../../../../core/data/base_repository.dart';
import '../../../../core/entities/paginate_list.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/prepared_order.dart';
import '../../domain/repositories/profile_repository.dart';
import '../data_sources/local/profile_local_data_source.dart';
import '../data_sources/remote/profile_remote_data_source.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImp extends BaseRepositoryImpl
    implements ProfileRepository {
  final ProfileLocalDataSource _local;
  final ProfileRemoteDataSource _http;

  ProfileRepositoryImp(
    this._local,
    this._http, {
    required BaseLocalDataSource baseLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: baseLocalDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, void>> changeProfilePicture({
    required XFile image,
  }) async {
    try {
      final token = await _local.token;
      await _http.changeProfilePicture(token: token, image: image);
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final token = await _local.token;
      await _http.logout(token: token);
      await _local.logout();
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> editDeliverMealTime({
    required String startsAt,
    required String endsAt,
  }) async {
    try {
      final token = await _local.token;
      await _http.editDeliverMealTime(
        token: token,
        startsAt: startsAt,
        endsAt: endsAt,
      );
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> editMaxMealsPerDay({
    required int maxMealsPerDay,
  }) async {
    try {
      final token = await _local.token;
      await _http.editMaxMealsPerDay(
        maxMealsPerDay: maxMealsPerDay,
        token: token,
      );
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, ChefBalanceModel>> getChefBalance() async {
    try {
      final token = await _local.token;
      final chefBalance = await _http.getChefBalance(token: token);
      return Right(chefBalance);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> getChefProfile() async {
    try {
      final token = await _local.token;
      final chefProfile = await _http.getChefProfile(token: token);
      return Right(chefProfile);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, PaginateList<PreparedOrder>>>
      getOrdersHistory(int page) async {
    try {
      final token = await _local.token;
      final result = await _http.getOrdersHistory(token: token,page: page);
      final List<PreparedOrder> list = [];
      for (PreparedOrderModel preparedOrderModel in result.data) {
        list.add(
          PreparedOrder(
            mealsCost: preparedOrderModel.mealsCost,
            id: preparedOrderModel.id,
            status: preparedOrderModel.status,
            paidToChef: preparedOrderModel.paidToChef,
            preparedAt: preparedOrderModel.preparedAt,
            type: preparedOrderModel.type,
          ),
        );
      }

      return Right(
        PaginateList(
          total: result.total,
          pages: result.numPages,
          data: list,
        ),
      );
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, List<OrderMealNoteModel>>> getOrderMealsNotes() async {
    try {
      final token = await _local.token;
      final orderMealsNotes = await _http.getOrderMealsNotes(token: token);
      return Right(orderMealsNotes);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, XFile?>> pickImage() async {
    try {
      final result = await _local.pickImage();
      return Right(result);
    } on PickFileException catch (e) {
      return const Left(PickFileFailure());
    }
  }
}
