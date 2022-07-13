import 'package:beitouti_chefs/core/util/constants.dart';
import 'package:beitouti_chefs/features/profile/data/models/chef_balance_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/order_meal_note_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/prepared_order_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/base_remote_datasource.dart';
import 'profile_remote_data_source.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<void> changeProfilePicture({
    required String token,
    required XFile image,
  }) async =>
      await performPostRequest<Null>(
        endpoint: Endpoints.changeProfilePicture,
        data: RequestBody.changeProfilePicture(
          image: image,
        ),
        options: GetOptions.getOptionsWithToken(token),
        queryParameters: {
          '_method': 'PUT',
        },
      );

  @override
  Future<void> logout({
    required String token,
  }) async =>
      await performDeleteRequest<Null>(
        endpoint: Endpoints.logout,
        token: token,
      );

  @override
  Future<void> editDeliverMealTime({
    required String token,
    required String startsAt,
    required String endsAt,
  }) async =>
      await performPostRequest<Null>(
        endpoint: Endpoints.editDeliverMealTime,
        data: RequestBody.editDeliverMealTime(
          deliveryStartsAt: startsAt,
          deliveryEndsAt: endsAt,
        ),
        options: GetOptions.getOptionsWithToken(token),
        queryParameters: {
          '_method': 'PUT',
        },
      );

  @override
  Future<void> editMaxMealsPerDay({
    required String token,
    required int maxMealsPerDay,
  }) async =>
      await performPostRequest<Null>(
        endpoint: Endpoints.editMaxMealPerDay,
        data: RequestBody.editMaxMealsPerDay(maxMealsPerDay: maxMealsPerDay),
        options: GetOptions.getOptionsWithToken(token),
        queryParameters: {
          '_method': 'PUT',
        },
      );

  @override
  Future<ChefBalanceModel> getChefBalance({
    required String token,
    String? startDate,
    String? endDate,
  }) async =>
      await performGetRequest<ChefBalanceModel>(
        Endpoints.getChefBalance,
        token,
      );

  @override
  Future<ProfileModel> getChefProfile({
    required String token,
  }) async =>
      await performGetRequest<ProfileModel>(
        Endpoints.getChefProfile,
        token,
      );

  @override
  Future<List<PreparedOrderModel>> getOrdersHistory({
    required String token,
  }) async =>
      await performGetListRequest<PreparedOrderModel>(
        endpoint: Endpoints.getOrderHistory,
        token: token,
      );

  @override
  Future<List<OrderMealNoteModel>> getOrderMealsNotes({
    required String token,
  }) async =>
      await performGetListRequest<OrderMealNoteModel>(
        endpoint: Endpoints.getOrderHistory,
        token: token,
      );
}
