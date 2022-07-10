import 'package:beitouti_chefs/core/data/base_local_datasource.dart';
import 'package:beitouti_chefs/core/data/base_repository.dart';
import 'package:beitouti_chefs/core/network/network_info.dart';
import 'package:beitouti_chefs/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/local/home_local_data_source.dart';
import '../data_sources/remote/home_remote_data_source.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImp extends BaseRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _http;
  final HomeLocalDataSource _local;

  HomeRepositoryImp(
    this._http,
    this._local, {
    required BaseLocalDataSource baseLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: baseLocalDataSource,
          networkInfo: networkInfo,
        );
}
