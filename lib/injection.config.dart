// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:file_picker/file_picker.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:location/location.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import 'core/data/base_local_data_source.dart' as _i35;
import 'core/data/base_repository.dart' as _i36;
import 'core/network/network_info.dart' as _i11;
import 'features/add_meal/data/data_sources/local/add_meal_local_data_source.dart'
    as _i25;
import 'features/add_meal/data/data_sources/local/add_meal_local_data_source_imp.dart'
    as _i26;
import 'features/add_meal/data/data_sources/remote/add_meal_remote_data_source.dart'
    as _i27;
import 'features/add_meal/data/data_sources/remote/add_meal_remote_data_source_imp.dart'
    as _i28;
import 'features/add_meal/data/repositories/add_meal_repo_imp.dart' as _i59;
import 'features/add_meal/domain/repositories/add_meal_repository.dart' as _i58;
import 'features/add_meal/domain/use_cases/add_category.dart' as _i77;
import 'features/add_meal/domain/use_cases/add_meal.dart' as _i60;
import 'features/add_meal/domain/use_cases/edit_meal.dart' as _i66;
import 'features/add_meal/domain/use_cases/get_categories.dart' as _i68;
import 'features/add_meal/domain/use_cases/get_final_price.dart' as _i69;
import 'features/add_meal/domain/use_cases/pick_image.dart' as _i74;
import 'features/add_meal/presentation/bloc/add_meal_bloc.dart' as _i78;
import 'features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i29;
import 'features/auth/data/data_sources/local/auth_local_data_source_imp.dart'
    as _i30;
import 'features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i31;
import 'features/auth/data/data_sources/remote/auth_remote_data_source_imp.dart'
    as _i32;
import 'features/auth/data/repositories/auth_repository_imp.dart' as _i34;
import 'features/auth/domain/repositories/auth_repository.dart' as _i33;
import 'features/auth/domain/use_cases/check_code_use_case.dart' as _i38;
import 'features/auth/domain/use_cases/request_register_use_case.dart' as _i53;
import 'features/auth/domain/use_cases/send_code_use_case.dart' as _i54;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i61;
import 'features/home/data/data_sources/local/home_local_data_source.dart'
    as _i44;
import 'features/home/data/data_sources/local/home_local_data_source_imp.dart'
    as _i45;
import 'features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i6;
import 'features/home/data/data_sources/remote/home_remote_data_source_imp.dart'
    as _i7;
import 'features/home/data/repositories/home_repository_imp.dart' as _i47;
import 'features/home/domain/repositories/home_repository.dart' as _i46;
import 'features/home/presentation/bloc/home_bloc.dart' as _i5;
import 'features/profile/data/data_sources/local/profile_local_data_source.dart'
    as _i49;
import 'features/profile/data/data_sources/local/profile_local_data_source_imp.dart'
    as _i50;
import 'features/profile/data/data_sources/remote/profile_remote_data_source.dart'
    as _i12;
import 'features/profile/data/data_sources/remote/profile_remote_data_source_imp.dart'
    as _i13;
import 'features/profile/data/repositories/profile_repository_imp.dart' as _i52;
import 'features/profile/domain/repositories/profile_repository.dart' as _i51;
import 'features/profile/domain/use_cases/change_profile_picture_use_case.dart'
    as _i62;
import 'features/profile/domain/use_cases/edit_deliver_meal_time_use_case.dart'
    as _i64;
import 'features/profile/domain/use_cases/edit_max_meals_per_day_use_case.dart'
    as _i65;
import 'features/profile/domain/use_cases/get_chef_balance_use_case.dart'
    as _i67;
import 'features/profile/domain/use_cases/get_order_meals_notes.dart' as _i70;
import 'features/profile/domain/use_cases/get_orders_history_use_case.dart'
    as _i71;
import 'features/profile/domain/use_cases/get_profile_use_case.dart' as _i72;
import 'features/profile/domain/use_cases/logout_use_case.dart' as _i73;
import 'features/profile/presentation/bloc/profile_bloc.dart' as _i75;
import 'features/show_menu/data/data_sources/local/show_menu_local_data_source.dart'
    as _i15;
import 'features/show_menu/data/data_sources/local/show_menu_local_data_source_imp.dart'
    as _i16;
import 'features/show_menu/data/data_sources/remote/show_menu_remote_data_source.dart'
    as _i17;
import 'features/show_menu/data/data_sources/remote/show_menu_remote_data_source_imp.dart'
    as _i18;
import 'features/show_menu/data/repositories/show_menu_imp.dart' as _i20;
import 'features/show_menu/domain/repositories/show_menu.dart' as _i19;
import 'features/show_menu/domain/use_cases/change_meal_availability.dart'
    as _i37;
import 'features/show_menu/domain/use_cases/decrease_max_meal_number.dart'
    as _i39;
import 'features/show_menu/domain/use_cases/delete_meal.dart' as _i40;
import 'features/show_menu/domain/use_cases/get_active_meals_count.dart'
    as _i41;
import 'features/show_menu/domain/use_cases/get_categories.dart' as _i42;
import 'features/show_menu/domain/use_cases/get_category_meals.dart' as _i43;
import 'features/show_menu/domain/use_cases/increase_max_meal_number.dart'
    as _i48;
import 'features/show_menu/presentation/bloc/show_menu_bloc.dart' as _i55;
import 'features/splash/data/data_sources/local/splash_local_data_source.dart'
    as _i21;
import 'features/splash/data/data_sources/local/splash_local_data_source_imp.dart'
    as _i22;
import 'features/splash/data/data_sources/remote/splash_remote_data_source.dart'
    as _i23;
import 'features/splash/data/data_sources/remote/splash_remote_data_source_imp.dart'
    as _i24;
import 'features/splash/data/repositories/splash_repository_imp.dart' as _i57;
import 'features/splash/domain/repositories/splash_repository.dart' as _i56;
import 'features/splash/domain/use_cases/check_auth_use_case.dart' as _i63;
import 'features/splash/presentation/bloc/splash_bloc.dart' as _i76;
import 'injection.dart' as _i79; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i8.ImagePicker>(() => registerModule.picker);
  gh.lazySingleton<_i9.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i10.Location>(() => registerModule.location);
  gh.lazySingleton<_i11.NetworkInfo>(
      () => _i11.NetworkInfoImpl(get<_i9.InternetConnectionChecker>()));
  gh.lazySingleton<_i12.ProfileRemoteDataSource>(
      () => _i13.ProfileRemoteDataSourceImp(dio: get<_i3.Dio>()));
  await gh.factoryAsync<_i14.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i15.ShowMenuLocalDataSource>(() =>
      _i16.ShowMenuLocalDataSourceImp(
          sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i17.ShowMenuRemoteDataSource>(
      () => _i18.ShowMenuRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i19.ShowMenuRepository>(() => _i20.ShowMenuRepositoryImp(
      get<_i17.ShowMenuRemoteDataSource>(), get<_i15.ShowMenuLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i21.SplashLocalDataSource>(() =>
      _i22.SplashLocalDataSourceImp(
          sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i23.SplashRemoteDataSource>(
      () => _i24.SplashRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i25.AddMealLocalDataSource>(() =>
      _i26.AddMealLocalDataSourceImp(get<_i8.ImagePicker>(),
          sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i27.AddMealRemoteDataSource>(
      () => _i28.AddMealRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i29.AuthLocalDataSource>(() => _i30.AuthLocalDataSourceImp(
      sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i31.AuthRemoteDataSource>(
      () => _i32.AuthRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i33.AuthRepository>(() => _i34.AuthRepositoryImp(
      get<_i29.AuthLocalDataSource>(), get<_i31.AuthRemoteDataSource>()));
  gh.lazySingleton<_i35.BaseLocalDataSource>(() => _i35.BaseLocalDataSourceImpl(
      sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i36.BaseRepository>(() => _i36.BaseRepositoryImpl(
      baseLocalDataSource: get<_i35.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i37.ChangeMealAvailabilityUseCase>(
      () => _i37.ChangeMealAvailabilityUseCase(get<_i19.ShowMenuRepository>()));
  gh.lazySingleton<_i38.CheckCodeUseCase>(
      () => _i38.CheckCodeUseCase(get<_i33.AuthRepository>()));
  gh.lazySingleton<_i39.DecreaseMaxMealNumberUseCase>(
      () => _i39.DecreaseMaxMealNumberUseCase(get<_i19.ShowMenuRepository>()));
  gh.lazySingleton<_i40.DeleteMealUseCase>(
      () => _i40.DeleteMealUseCase(get<_i19.ShowMenuRepository>()));
  gh.lazySingleton<_i41.GetActiveMealsUseCase>(
      () => _i41.GetActiveMealsUseCase(get<_i19.ShowMenuRepository>()));
  gh.lazySingleton<_i42.GetCategoriesUseCase>(
      () => _i42.GetCategoriesUseCase(get<_i19.ShowMenuRepository>()));
  gh.lazySingleton<_i43.GetCategoryMealsUseCase>(
      () => _i43.GetCategoryMealsUseCase(get<_i19.ShowMenuRepository>()));
  gh.lazySingleton<_i44.HomeLocalDataSource>(() => _i45.HomeLocalDataSourceImp(
      sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i46.HomeRepository>(() => _i47.HomeRepositoryImp(
      get<_i6.HomeRemoteDataSource>(), get<_i44.HomeLocalDataSource>(),
      baseLocalDataSource: get<_i35.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i48.IncreaseMaxMealNumberUseCase>(
      () => _i48.IncreaseMaxMealNumberUseCase(get<_i19.ShowMenuRepository>()));
  gh.lazySingleton<_i49.ProfileLocalDataSource>(() =>
      _i50.ProfileLocalDataSourceImp(
          sharedPreferences: get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i51.ProfileRepository>(() => _i52.ProfileRepositoryImp(
      get<_i49.ProfileLocalDataSource>(), get<_i12.ProfileRemoteDataSource>(),
      baseLocalDataSource: get<_i35.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i53.RequestRegisterUseCase>(
      () => _i53.RequestRegisterUseCase(get<_i33.AuthRepository>()));
  gh.lazySingleton<_i54.SendCodeUseCase>(
      () => _i54.SendCodeUseCase(get<_i33.AuthRepository>()));
  gh.factory<_i55.ShowMenuBloc>(() => _i55.ShowMenuBloc(
      get<_i42.GetCategoriesUseCase>(),
      get<_i41.GetActiveMealsUseCase>(),
      get<_i43.GetCategoryMealsUseCase>(),
      get<_i40.DeleteMealUseCase>(),
      get<_i37.ChangeMealAvailabilityUseCase>(),
      get<_i48.IncreaseMaxMealNumberUseCase>(),
      get<_i39.DecreaseMaxMealNumberUseCase>()));
  gh.lazySingleton<_i56.SplashRepository>(() => _i57.SplashRepositoryImp(
      get<_i21.SplashLocalDataSource>(), get<_i23.SplashRemoteDataSource>(),
      baseLocalDataSource: get<_i35.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i58.AddMealRepository>(() => _i59.AddMealRepoImp(
      get<_i25.AddMealLocalDataSource>(), get<_i27.AddMealRemoteDataSource>(),
      baseLocalDataSource: get<_i35.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i60.AddMealUseCase>(
      () => _i60.AddMealUseCase(get<_i58.AddMealRepository>()));
  gh.factory<_i61.AuthBloc>(() => _i61.AuthBloc(
      get<_i38.CheckCodeUseCase>(),
      get<_i53.RequestRegisterUseCase>(),
      get<_i54.SendCodeUseCase>(),
      get<_i10.Location>(),
      get<_i4.FilePicker>()));
  gh.lazySingleton<_i62.ChangeProfilePictureUseCase>(
      () => _i62.ChangeProfilePictureUseCase(get<_i51.ProfileRepository>()));
  gh.lazySingleton<_i63.CheckAuthUseCase>(
      () => _i63.CheckAuthUseCase(get<_i56.SplashRepository>()));
  gh.lazySingleton<_i64.EditDeliverTimeUseCase>(
      () => _i64.EditDeliverTimeUseCase(get<_i51.ProfileRepository>()));
  gh.lazySingleton<_i65.EditMaxMealsPerDayUseCase>(
      () => _i65.EditMaxMealsPerDayUseCase(get<_i51.ProfileRepository>()));
  gh.lazySingleton<_i66.EditMealUseCase>(
      () => _i66.EditMealUseCase(get<_i58.AddMealRepository>()));
  gh.lazySingleton<_i67.GetChefBalanceUseCase>(
      () => _i67.GetChefBalanceUseCase(get<_i51.ProfileRepository>()));
  gh.lazySingleton<_i68.GetFinalPriceUseCase>(
      () => _i68.GetFinalPriceUseCase(get<_i58.AddMealRepository>()));
  gh.lazySingleton<_i69.GetFinalPriceUseCase>(
      () => _i69.GetFinalPriceUseCase(get<_i58.AddMealRepository>()));
  gh.lazySingleton<_i70.GetOrderMealsNotesUseCase>(
      () => _i70.GetOrderMealsNotesUseCase(get<_i51.ProfileRepository>()));
  gh.lazySingleton<_i71.GetOrdersHistoryUseCase>(
      () => _i71.GetOrdersHistoryUseCase(get<_i51.ProfileRepository>()));
  gh.lazySingleton<_i72.GetProfileUseCase>(
      () => _i72.GetProfileUseCase(get<_i51.ProfileRepository>()));
  gh.lazySingleton<_i73.LogoutUseCase>(
      () => _i73.LogoutUseCase(get<_i51.ProfileRepository>()));
  gh.lazySingleton<_i74.PickImageUseCase>(
      () => _i74.PickImageUseCase(get<_i58.AddMealRepository>()));
  gh.factory<_i75.ProfileBloc>(() => _i75.ProfileBloc(
      get<_i62.ChangeProfilePictureUseCase>(),
      get<_i73.LogoutUseCase>(),
      get<_i70.GetOrderMealsNotesUseCase>(),
      get<_i71.GetOrdersHistoryUseCase>(),
      get<_i64.EditDeliverTimeUseCase>(),
      get<_i67.GetChefBalanceUseCase>(),
      get<_i72.GetProfileUseCase>(),
      get<_i65.EditMaxMealsPerDayUseCase>()));
  gh.factory<_i76.SplashBloc>(
      () => _i76.SplashBloc(get<_i63.CheckAuthUseCase>()));
  gh.lazySingleton<_i77.AddCategoryUseCase>(
      () => _i77.AddCategoryUseCase(get<_i58.AddMealRepository>()));
  gh.factory<_i78.AddMealBloc>(() => _i78.AddMealBloc(
      get<_i74.PickImageUseCase>(),
      get<_i42.GetCategoriesUseCase>(),
      get<_i77.AddCategoryUseCase>(),
      get<_i60.AddMealUseCase>(),
      get<_i69.GetFinalPriceUseCase>(),
      get<_i66.EditMealUseCase>()));
  return get;
}

class _$RegisterModule extends _i79.RegisterModule {}
