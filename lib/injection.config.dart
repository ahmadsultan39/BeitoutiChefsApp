// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'core/data/base_local_data_source.dart' as _i18;
import 'core/data/base_remote_datasource.dart' as _i19;
import 'core/data/base_repository.dart' as _i20;
import 'core/network/network_info.dart' as _i6;
import 'features/add_meal/data/data_sources/local/add_meal_local_data_source.dart'
    as _i14;
import 'features/add_meal/data/data_sources/local/add_meal_local_data_source_imp.dart'
    as _i15;
import 'features/add_meal/data/data_sources/remote/add_meal_remote_data_source.dart'
    as _i16;
import 'features/add_meal/data/data_sources/remote/add_meal_remote_data_source_imp.dart'
    as _i17;
import 'features/add_meal/data/repositories/add_meal_repo_imp.dart' as _i30;
import 'features/add_meal/domain/repositories/add_meal_repository.dart' as _i29;
import 'features/add_meal/domain/use_cases/add_category.dart' as _i36;
import 'features/add_meal/domain/use_cases/add_meal.dart' as _i31;
import 'features/add_meal/domain/use_cases/edit_meal.dart' as _i32;
import 'features/add_meal/domain/use_cases/get_categories.dart' as _i34;
import 'features/add_meal/domain/use_cases/get_final_price.dart' as _i33;
import 'features/add_meal/domain/use_cases/pick_image.dart' as _i35;
import 'features/add_meal/presentation/bloc/add_meal_bloc.dart' as _i37;
import 'features/show_menu/data/data_sources/local/show_menu_local_data_source.dart'
    as _i8;
import 'features/show_menu/data/data_sources/local/show_menu_local_data_source_imp.dart'
    as _i9;
import 'features/show_menu/data/data_sources/remote/show_menu_remote_data_source.dart'
    as _i10;
import 'features/show_menu/data/data_sources/remote/show_menu_remote_data_source_imp.dart'
    as _i11;
import 'features/show_menu/data/repositories/show_menu_imp.dart' as _i13;
import 'features/show_menu/domain/repositories/show_menu.dart' as _i12;
import 'features/show_menu/domain/use_cases/change_meal_availability.dart'
    as _i21;
import 'features/show_menu/domain/use_cases/decrease_max_meal_number.dart'
    as _i22;
import 'features/show_menu/domain/use_cases/delete_meal.dart' as _i23;
import 'features/show_menu/domain/use_cases/get_active_meals_count.dart'
    as _i24;
import 'features/show_menu/domain/use_cases/get_categories.dart' as _i25;
import 'features/show_menu/domain/use_cases/get_category_meals.dart' as _i26;
import 'features/show_menu/domain/use_cases/increase_max_meal_number.dart'
    as _i27;
import 'features/show_menu/presentation/bloc/show_menu_bloc.dart' as _i28;
import 'injection.dart' as _i38; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.ImagePicker>(() => registerModule.picker);
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  await gh.factoryAsync<_i7.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i8.ShowMenuLocalDataSource>(() =>
      _i9.ShowMenuLocalDataSourceImp(
          sharedPreferences: get<_i7.SharedPreferences>()));
  gh.lazySingleton<_i10.ShowMenuRemoteDataSource>(
      () => _i11.ShowMenuRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i12.ShowMenuRepository>(() => _i13.ShowMenuRepositoryImp(
      get<_i10.ShowMenuRemoteDataSource>(), get<_i8.ShowMenuLocalDataSource>(),
      networkInfo: get<_i6.NetworkInfo>()));
  gh.lazySingleton<_i14.AddMealLocalDataSource>(() =>
      _i15.AddMealLocalDataSourceImp(get<_i4.ImagePicker>(),
          sharedPreferences: get<_i7.SharedPreferences>()));
  gh.lazySingleton<_i16.AddMealRemoteDataSource>(
      () => _i17.AddMealRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i18.BaseLocalDataSource>(() => _i18.BaseLocalDataSourceImp(
      sharedPreferences: get<_i7.SharedPreferences>()));
  gh.lazySingleton<_i19.BaseRemoteDataSource>(
      () => _i19.BaseRemoteDataSourceImpl(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i20.BaseRepository>(() => _i20.BaseRepositoryImpl(
      baseLocalDataSource: get<_i18.BaseLocalDataSource>(),
      networkInfo: get<_i6.NetworkInfo>()));
  gh.lazySingleton<_i21.ChangeMealAvailabilityUseCase>(
      () => _i21.ChangeMealAvailabilityUseCase(get<_i12.ShowMenuRepository>()));
  gh.lazySingleton<_i22.DecreaseMaxMealNumberUseCase>(
      () => _i22.DecreaseMaxMealNumberUseCase(get<_i12.ShowMenuRepository>()));
  gh.lazySingleton<_i23.DeleteMealUseCase>(
      () => _i23.DeleteMealUseCase(get<_i12.ShowMenuRepository>()));
  gh.lazySingleton<_i24.GetActiveMealsUseCase>(
      () => _i24.GetActiveMealsUseCase(get<_i12.ShowMenuRepository>()));
  gh.lazySingleton<_i25.GetCategoriesUseCase>(
      () => _i25.GetCategoriesUseCase(get<_i12.ShowMenuRepository>()));
  gh.lazySingleton<_i26.GetCategoryMealsUseCase>(
      () => _i26.GetCategoryMealsUseCase(get<_i12.ShowMenuRepository>()));
  gh.lazySingleton<_i27.IncreaseMaxMealNumberUseCase>(
      () => _i27.IncreaseMaxMealNumberUseCase(get<_i12.ShowMenuRepository>()));
  gh.factory<_i28.ShowMenuBloc>(() => _i28.ShowMenuBloc(
      get<_i25.GetCategoriesUseCase>(),
      get<_i24.GetActiveMealsUseCase>(),
      get<_i26.GetCategoryMealsUseCase>(),
      get<_i23.DeleteMealUseCase>(),
      get<_i21.ChangeMealAvailabilityUseCase>(),
      get<_i27.IncreaseMaxMealNumberUseCase>(),
      get<_i22.DecreaseMaxMealNumberUseCase>()));
  gh.lazySingleton<_i29.AddMealRepository>(() => _i30.AddMealRepoImp(
      get<_i14.AddMealLocalDataSource>(), get<_i16.AddMealRemoteDataSource>(),
      baseLocalDataSource: get<_i18.BaseLocalDataSource>(),
      networkInfo: get<_i6.NetworkInfo>()));
  gh.lazySingleton<_i31.AddMealUseCase>(
      () => _i31.AddMealUseCase(get<_i29.AddMealRepository>()));
  gh.lazySingleton<_i32.EditMealUseCase>(
      () => _i32.EditMealUseCase(get<_i29.AddMealRepository>()));
  gh.lazySingleton<_i33.GetFinalPriceUseCase>(
      () => _i33.GetFinalPriceUseCase(get<_i29.AddMealRepository>()));
  gh.lazySingleton<_i34.GetFinalPriceUseCase>(
      () => _i34.GetFinalPriceUseCase(get<_i29.AddMealRepository>()));
  gh.lazySingleton<_i35.PickImageUseCase>(
      () => _i35.PickImageUseCase(get<_i29.AddMealRepository>()));
  gh.lazySingleton<_i36.AddCategoryUseCase>(
      () => _i36.AddCategoryUseCase(get<_i29.AddMealRepository>()));
  gh.factory<_i37.AddMealBloc>(() => _i37.AddMealBloc(
      get<_i35.PickImageUseCase>(),
      get<_i25.GetCategoriesUseCase>(),
      get<_i36.AddCategoryUseCase>(),
      get<_i31.AddMealUseCase>(),
      get<_i33.GetFinalPriceUseCase>(),
      get<_i32.EditMealUseCase>()));
  return get;
}

class _$RegisterModule extends _i38.RegisterModule {}
