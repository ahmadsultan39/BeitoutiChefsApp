import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/base_remote_datasource.dart';
import 'splash_remote_data_source.dart';

@LazySingleton(as: SplashRemoteDataSource)
class SplashRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements SplashRemoteDataSource {
  SplashRemoteDataSourceImp({
    required Dio dio,
  }) : super(dio: dio);
}
