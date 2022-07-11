import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/base_remote_datasource.dart';
import 'profile_remote_data_source.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImp({required Dio dio}) : super(dio: dio);
}
