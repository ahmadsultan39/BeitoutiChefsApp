// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:file_picker/file_picker.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import 'features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i7;
import 'features/auth/data/data_sources/local/auth_local_data_source_imp.dart'
    as _i8;
import 'features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i9;
import 'features/auth/data/data_sources/remote/auth_remote_data_source_imp.dart'
    as _i10;
import 'features/auth/data/repositories/auth_repository_imp.dart' as _i12;
import 'features/auth/domain/repositories/auth_repository.dart' as _i11;
import 'features/auth/domain/use_cases/check_code_use_case.dart' as _i13;
import 'features/auth/domain/use_cases/request_register_use_case.dart' as _i14;
import 'features/auth/domain/use_cases/send_code_use_case.dart' as _i15;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i16;
import 'injection.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.FilePicker>(() => registerModule.filePicker);
  gh.lazySingleton<_i5.Location>(() => registerModule.location);
  await gh.factoryAsync<_i6.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i7.AuthLocalDataSource>(() => _i8.AuthLocalDataSourceImp(
      sharedPreferences: get<_i6.SharedPreferences>()));
  gh.lazySingleton<_i9.AuthRemoteDataSource>(
      () => _i10.AuthRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i11.AuthRepository>(() => _i12.AuthRepositoryImp(
      get<_i7.AuthLocalDataSource>(), get<_i9.AuthRemoteDataSource>()));
  gh.lazySingleton<_i13.CheckCodeUseCase>(
      () => _i13.CheckCodeUseCase(get<_i11.AuthRepository>()));
  gh.lazySingleton<_i14.RequestRegisterUseCase>(
      () => _i14.RequestRegisterUseCase(get<_i11.AuthRepository>()));
  gh.lazySingleton<_i15.SendCodeUseCase>(
      () => _i15.SendCodeUseCase(get<_i11.AuthRepository>()));
  gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(
      get<_i13.CheckCodeUseCase>(),
      get<_i14.RequestRegisterUseCase>(),
      get<_i15.SendCodeUseCase>(),
      get<_i5.Location>(),
      get<_i4.FilePicker>()));
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}
