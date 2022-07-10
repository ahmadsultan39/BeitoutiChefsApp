// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:file_picker/file_picker.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:location/location.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import 'core/data/base_local_datasource.dart' as _i22;
import 'core/data/base_repository.dart' as _i23;
import 'core/network/network_info.dart' as _i10;
import 'features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i16;
import 'features/auth/data/data_sources/local/auth_local_data_source_imp.dart'
    as _i17;
import 'features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i18;
import 'features/auth/data/data_sources/remote/auth_remote_data_source_imp.dart'
    as _i19;
import 'features/auth/data/repositories/auth_repository_imp.dart' as _i21;
import 'features/auth/domain/repositories/auth_repository.dart' as _i20;
import 'features/auth/domain/use_cases/check_code_use_case.dart' as _i24;
import 'features/auth/domain/use_cases/request_register_use_case.dart' as _i29;
import 'features/auth/domain/use_cases/send_code_use_case.dart' as _i30;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i33;
import 'features/home/data/data_sources/local/home_local_data_source.dart'
    as _i25;
import 'features/home/data/data_sources/local/home_local_data_source_imp.dart'
    as _i26;
import 'features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i6;
import 'features/home/data/data_sources/remote/home_remote_data_source_imp.dart'
    as _i7;
import 'features/home/data/repositories/home_repository_imp.dart' as _i28;
import 'features/home/domain/repositories/home_repository.dart' as _i27;
import 'features/home/presentation/bloc/home_bloc.dart' as _i5;
import 'features/splash/data/data_sources/local/splash_local_data_source.dart'
    as _i12;
import 'features/splash/data/data_sources/local/splash_local_data_source_imp.dart'
    as _i13;
import 'features/splash/data/data_sources/remote/splash_remote_data_source.dart'
    as _i14;
import 'features/splash/data/data_sources/remote/splash_remote_data_source_imp.dart'
    as _i15;
import 'features/splash/data/repositories/splash_repository_imp.dart' as _i32;
import 'features/splash/domain/repositories/splash_repository.dart' as _i31;
import 'features/splash/domain/use_cases/check_auth_use_case.dart' as _i34;
import 'features/splash/presentation/bloc/splash_bloc.dart' as _i35;
import 'injection.dart' as _i36; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.FilePicker>(() => registerModule.filePicker);
  gh.factory<_i5.HomeBloc>(() => _i5.HomeBloc());
  gh.lazySingleton<_i6.HomeRemoteDataSource>(
      () => _i7.HomeRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i8.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i9.Location>(() => registerModule.location);
  gh.lazySingleton<_i10.NetworkInfo>(
      () => _i10.NetworkInfoImpl(get<_i8.InternetConnectionChecker>()));
  await gh.factoryAsync<_i11.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i12.SplashLocalDataSource>(() =>
      _i13.SplashLocalDataSourceImp(
          sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i14.SplashRemoteDataSource>(
      () => _i15.SplashRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i16.AuthLocalDataSource>(() => _i17.AuthLocalDataSourceImp(
      sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i18.AuthRemoteDataSource>(
      () => _i19.AuthRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i20.AuthRepository>(() => _i21.AuthRepositoryImp(
      get<_i16.AuthLocalDataSource>(), get<_i18.AuthRemoteDataSource>()));
  gh.lazySingleton<_i22.BaseLocalDataSource>(() => _i22.BaseLocalDataSourceImpl(
      sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i23.BaseRepository>(() => _i23.BaseRepositoryImpl(
      baseLocalDataSource: get<_i22.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i24.CheckCodeUseCase>(
      () => _i24.CheckCodeUseCase(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i25.HomeLocalDataSource>(() => _i26.HomeLocalDataSourceImp(
      sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i27.HomeRepository>(() => _i28.HomeRepositoryImp(
      get<_i6.HomeRemoteDataSource>(), get<_i25.HomeLocalDataSource>(),
      baseLocalDataSource: get<_i22.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i29.RequestRegisterUseCase>(
      () => _i29.RequestRegisterUseCase(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i30.SendCodeUseCase>(
      () => _i30.SendCodeUseCase(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i31.SplashRepository>(() => _i32.SplashRepositoryImp(
      get<_i12.SplashLocalDataSource>(), get<_i14.SplashRemoteDataSource>(),
      baseLocalDataSource: get<_i22.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.factory<_i33.AuthBloc>(() => _i33.AuthBloc(
      get<_i24.CheckCodeUseCase>(),
      get<_i29.RequestRegisterUseCase>(),
      get<_i30.SendCodeUseCase>(),
      get<_i9.Location>(),
      get<_i4.FilePicker>()));
  gh.lazySingleton<_i34.CheckAuthUseCase>(
      () => _i34.CheckAuthUseCase(get<_i31.SplashRepository>()));
  gh.factory<_i35.SplashBloc>(
      () => _i35.SplashBloc(get<_i34.CheckAuthUseCase>()));
  return get;
}

class _$RegisterModule extends _i36.RegisterModule {}
