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
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import 'core/data/base_local_datasource.dart' as _i25;
import 'core/data/base_repository.dart' as _i26;
import 'core/network/network_info.dart' as _i10;
import 'features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i19;
import 'features/auth/data/data_sources/local/auth_local_data_source_imp.dart'
    as _i20;
import 'features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i21;
import 'features/auth/data/data_sources/remote/auth_remote_data_source_imp.dart'
    as _i22;
import 'features/auth/data/repositories/auth_repository_imp.dart' as _i24;
import 'features/auth/domain/repositories/auth_repository.dart' as _i23;
import 'features/auth/domain/use_cases/check_code_use_case.dart' as _i27;
import 'features/auth/domain/use_cases/request_register_use_case.dart' as _i36;
import 'features/auth/domain/use_cases/send_code_use_case.dart' as _i37;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i40;
import 'features/home/data/data_sources/local/home_local_data_source.dart'
    as _i28;
import 'features/home/data/data_sources/local/home_local_data_source_imp.dart'
    as _i29;
import 'features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i6;
import 'features/home/data/data_sources/remote/home_remote_data_source_imp.dart'
    as _i7;
import 'features/home/data/repositories/home_repository_imp.dart' as _i31;
import 'features/home/domain/repositories/home_repository.dart' as _i30;
import 'features/home/presentation/bloc/home_bloc.dart' as _i5;
import 'features/profile/data/data_sources/local/profile_local_data_source.dart'
    as _i32;
import 'features/profile/data/data_sources/local/profile_local_data_source_imp.dart'
    as _i33;
import 'features/profile/data/data_sources/remote/profile_remote_data_source.dart'
    as _i12;
import 'features/profile/data/data_sources/remote/profile_remote_data_source_imp.dart'
    as _i13;
import 'features/profile/data/repositories/profile_repository_imp.dart' as _i35;
import 'features/profile/domain/repositories/profile_repository.dart' as _i34;
import 'features/profile/presentation/bloc/profile_bloc.dart' as _i11;
import 'features/splash/data/data_sources/local/splash_local_data_source.dart'
    as _i15;
import 'features/splash/data/data_sources/local/splash_local_data_source_imp.dart'
    as _i16;
import 'features/splash/data/data_sources/remote/splash_remote_data_source.dart'
    as _i17;
import 'features/splash/data/data_sources/remote/splash_remote_data_source_imp.dart'
    as _i18;
import 'features/splash/data/repositories/splash_repository_imp.dart' as _i39;
import 'features/splash/domain/repositories/splash_repository.dart' as _i38;
import 'features/splash/domain/use_cases/check_auth_use_case.dart' as _i41;
import 'features/splash/presentation/bloc/splash_bloc.dart' as _i42;
import 'injection.dart' as _i43; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i11.ProfileBloc>(() => _i11.ProfileBloc());
  gh.lazySingleton<_i12.ProfileRemoteDataSource>(
      () => _i13.ProfileRemoteDataSourceImp(dio: get<_i3.Dio>()));
  await gh.factoryAsync<_i14.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i15.SplashLocalDataSource>(() =>
      _i16.SplashLocalDataSourceImp(
          sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i17.SplashRemoteDataSource>(
      () => _i18.SplashRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i19.AuthLocalDataSource>(() => _i20.AuthLocalDataSourceImp(
      sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i21.AuthRemoteDataSource>(
      () => _i22.AuthRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i23.AuthRepository>(() => _i24.AuthRepositoryImp(
      get<_i19.AuthLocalDataSource>(), get<_i21.AuthRemoteDataSource>()));
  gh.lazySingleton<_i25.BaseLocalDataSource>(() => _i25.BaseLocalDataSourceImpl(
      sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i26.BaseRepository>(() => _i26.BaseRepositoryImpl(
      baseLocalDataSource: get<_i25.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i27.CheckCodeUseCase>(
      () => _i27.CheckCodeUseCase(get<_i23.AuthRepository>()));
  gh.lazySingleton<_i28.HomeLocalDataSource>(() => _i29.HomeLocalDataSourceImp(
      sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i30.HomeRepository>(() => _i31.HomeRepositoryImp(
      get<_i6.HomeRemoteDataSource>(), get<_i28.HomeLocalDataSource>(),
      baseLocalDataSource: get<_i25.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i32.ProfileLocalDataSource>(() =>
      _i33.ProfileLocalDataSourceImp(
          sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i34.ProfileRepository>(() => _i35.ProfileRepositoryImp(
      get<_i32.ProfileLocalDataSource>(), get<_i12.ProfileRemoteDataSource>(),
      baseLocalDataSource: get<_i25.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i36.RequestRegisterUseCase>(
      () => _i36.RequestRegisterUseCase(get<_i23.AuthRepository>()));
  gh.lazySingleton<_i37.SendCodeUseCase>(
      () => _i37.SendCodeUseCase(get<_i23.AuthRepository>()));
  gh.lazySingleton<_i38.SplashRepository>(() => _i39.SplashRepositoryImp(
      get<_i15.SplashLocalDataSource>(), get<_i17.SplashRemoteDataSource>(),
      baseLocalDataSource: get<_i25.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.factory<_i40.AuthBloc>(() => _i40.AuthBloc(
      get<_i27.CheckCodeUseCase>(),
      get<_i36.RequestRegisterUseCase>(),
      get<_i37.SendCodeUseCase>(),
      get<_i9.Location>(),
      get<_i4.FilePicker>()));
  gh.lazySingleton<_i41.CheckAuthUseCase>(
      () => _i41.CheckAuthUseCase(get<_i38.SplashRepository>()));
  gh.factory<_i42.SplashBloc>(
      () => _i42.SplashBloc(get<_i41.CheckAuthUseCase>()));
  return get;
}

class _$RegisterModule extends _i43.RegisterModule {}
