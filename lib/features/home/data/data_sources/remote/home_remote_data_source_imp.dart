import 'package:beitouti_chefs/core/data/base_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'home_remote_data_source.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements HomeRemoteDataSource {
  HomeRemoteDataSourceImp({required Dio dio}) : super(dio: dio);
}
