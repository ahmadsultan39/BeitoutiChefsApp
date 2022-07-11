import 'package:injectable/injectable.dart';

import '../../../../core/data/base_local_datasource.dart';
import '../../../../core/data/base_repository.dart';
import '../../../../core/network/network_info.dart';
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
}
