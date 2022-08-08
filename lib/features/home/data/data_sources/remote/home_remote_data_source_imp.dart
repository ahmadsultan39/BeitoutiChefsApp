import 'package:beitouti_chefs/core/data/base_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/util/constants.dart';
import 'home_remote_data_source.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements HomeRemoteDataSource {
  HomeRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<void> changeAvailability({
    required String token,
  }) =>
      performPostRequest<Null>(
        endpoint: Endpoints.changeAvailabilityStatus,
        options: GetOptions.getOptionsWithToken(token),
        queryParameters: {
          '_method': 'PUT',
        },
      );
}
