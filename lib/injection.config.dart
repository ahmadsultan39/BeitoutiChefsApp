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
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import 'core/data/base_local_data_source.dart' as _i44;
import 'core/data/base_repository.dart' as _i45;
import 'core/network/network_info.dart' as _i11;
import 'features/add_meal/data/data_sources/local/add_meal_local_data_source.dart'
    as _i33;
import 'features/add_meal/data/data_sources/local/add_meal_local_data_source_imp.dart'
    as _i34;
import 'features/add_meal/data/data_sources/remote/add_meal_remote_data_source.dart'
    as _i35;
import 'features/add_meal/data/data_sources/remote/add_meal_remote_data_source_imp.dart'
    as _i36;
import 'features/add_meal/data/repositories/add_meal_repo_imp.dart' as _i78;
import 'features/add_meal/domain/repositories/add_meal_repository.dart' as _i77;
import 'features/add_meal/domain/use_cases/add_category.dart' as _i101;
import 'features/add_meal/domain/use_cases/add_meal.dart' as _i79;
import 'features/add_meal/domain/use_cases/edit_meal.dart' as _i86;
import 'features/add_meal/domain/use_cases/get_categories.dart' as _i88;
import 'features/add_meal/domain/use_cases/get_final_price.dart' as _i89;
import 'features/add_meal/domain/use_cases/pick_image.dart' as _i97;
import 'features/add_meal/presentation/bloc/add_meal_bloc.dart' as _i102;
import 'features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i38;
import 'features/auth/data/data_sources/local/auth_local_data_source_imp.dart'
    as _i39;
import 'features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i40;
import 'features/auth/data/data_sources/remote/auth_remote_data_source_imp.dart'
    as _i41;
import 'features/auth/data/repositories/auth_repository_imp.dart' as _i43;
import 'features/auth/domain/repositories/auth_repository.dart' as _i42;
import 'features/auth/domain/use_cases/check_code_use_case.dart' as _i47;
import 'features/auth/domain/use_cases/request_register_use_case.dart' as _i71;
import 'features/auth/domain/use_cases/send_code_use_case.dart' as _i72;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i80;
import 'features/home/data/data_sources/local/home_local_data_source.dart'
    as _i58;
import 'features/home/data/data_sources/local/home_local_data_source_imp.dart'
    as _i59;
import 'features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i6;
import 'features/home/data/data_sources/remote/home_remote_data_source_imp.dart'
    as _i7;
import 'features/home/data/repositories/home_repository_imp.dart' as _i61;
import 'features/home/domain/repositories/home_repository.dart' as _i60;
import 'features/home/presentation/bloc/home_bloc.dart' as _i5;
import 'features/orders/data/data_sources/local/orders_local_data_source.dart'
    as _i63;
import 'features/orders/data/data_sources/local/orders_local_data_source_imp.dart'
    as _i64;
import 'features/orders/data/data_sources/remote/orders_remote_data_source.dart'
    as _i12;
import 'features/orders/data/data_sources/remote/orders_remote_data_source_imp.dart'
    as _i13;
import 'features/orders/data/repositories/orders_repository_imp.dart' as _i66;
import 'features/orders/domain/repositories/orders_repository.dart' as _i65;
import 'features/orders/domain/use_cases/change_status.dart' as _i82;
import 'features/orders/domain/use_cases/get_orders_times.dart' as _i92;
import 'features/orders/domain/use_cases/get_time_order.dart' as _i94;
import 'features/orders/presentation/bloc/orders_bloc.dart' as _i96;
import 'features/profile/data/data_sources/local/profile_local_data_source.dart'
    as _i67;
import 'features/profile/data/data_sources/local/profile_local_data_source_imp.dart'
    as _i68;
import 'features/profile/data/data_sources/remote/profile_remote_data_source.dart'
    as _i14;
import 'features/profile/data/data_sources/remote/profile_remote_data_source_imp.dart'
    as _i15;
import 'features/profile/data/repositories/profile_repository_imp.dart' as _i70;
import 'features/profile/domain/repositories/profile_repository.dart' as _i69;
import 'features/profile/domain/use_cases/change_profile_picture_use_case.dart'
    as _i81;
import 'features/profile/domain/use_cases/edit_deliver_meal_time_use_case.dart'
    as _i84;
import 'features/profile/domain/use_cases/edit_max_meals_per_day_use_case.dart'
    as _i85;
import 'features/profile/domain/use_cases/get_chef_balance_use_case.dart'
    as _i87;
import 'features/profile/domain/use_cases/get_order_meals_notes.dart' as _i90;
import 'features/profile/domain/use_cases/get_orders_history_use_case.dart'
    as _i91;
import 'features/profile/domain/use_cases/get_profile_use_case.dart' as _i93;
import 'features/profile/domain/use_cases/logout_use_case.dart' as _i95;
import 'features/profile/domain/use_cases/pick_image_use_case.dart' as _i98;
import 'features/profile/presentation/bloc/profile_bloc.dart' as _i99;
import 'features/show_menu/data/data_sources/local/show_menu_local_data_source.dart'
    as _i17;
import 'features/show_menu/data/data_sources/local/show_menu_local_data_source_imp.dart'
    as _i18;
import 'features/show_menu/data/data_sources/remote/show_menu_remote_data_source.dart'
    as _i19;
import 'features/show_menu/data/data_sources/remote/show_menu_remote_data_source_imp.dart'
    as _i20;
import 'features/show_menu/data/repositories/show_menu_imp.dart' as _i22;
import 'features/show_menu/domain/repositories/show_menu.dart' as _i21;
import 'features/show_menu/domain/use_cases/change_meal_availability.dart'
    as _i46;
import 'features/show_menu/domain/use_cases/decrease_max_meal_number.dart'
    as _i48;
import 'features/show_menu/domain/use_cases/delete_meal.dart' as _i49;
import 'features/show_menu/domain/use_cases/get_active_meals_count.dart'
    as _i53;
import 'features/show_menu/domain/use_cases/get_categories.dart' as _i54;
import 'features/show_menu/domain/use_cases/get_category_meals.dart' as _i55;
import 'features/show_menu/domain/use_cases/increase_max_meal_number.dart'
    as _i62;
import 'features/show_menu/presentation/bloc/show_menu_bloc.dart' as _i73;
import 'features/splash/data/data_sources/local/splash_local_data_source.dart'
    as _i23;
import 'features/splash/data/data_sources/local/splash_local_data_source_imp.dart'
    as _i24;
import 'features/splash/data/data_sources/remote/splash_remote_data_source.dart'
    as _i25;
import 'features/splash/data/data_sources/remote/splash_remote_data_source_imp.dart'
    as _i26;
import 'features/splash/data/repositories/splash_repository_imp.dart' as _i75;
import 'features/splash/domain/repositories/splash_repository.dart' as _i74;
import 'features/splash/domain/use_cases/check_auth_use_case.dart' as _i83;
import 'features/splash/presentation/bloc/splash_bloc.dart' as _i100;
import 'features/subscriptions/data/data_sources/local/subscriptions_local_data_source.dart'
    as _i27;
import 'features/subscriptions/data/data_sources/local/subscriptions_local_data_source_imp.dart'
    as _i28;
import 'features/subscriptions/data/data_sources/remote/subscriptions_remote_data_source.dart'
    as _i29;
import 'features/subscriptions/data/data_sources/remote/subscriptions_remote_data_source_imp.dart'
    as _i30;
import 'features/subscriptions/data/repositories/subscriptions_repository_imp.dart'
    as _i32;
import 'features/subscriptions/domain/repositories/subscriptions_repository.dart'
    as _i31;
import 'features/subscriptions/domain/use_cases/add_new_subscription.dart'
    as _i37;
import 'features/subscriptions/domain/use_cases/delete_subscription.dart'
    as _i50;
import 'features/subscriptions/domain/use_cases/edit_subscription.dart' as _i52;
import 'features/subscriptions/domain/use_cases/edit_subscription_availability.dart'
    as _i51;
import 'features/subscriptions/domain/use_cases/get_chef_meals.dart' as _i56;
import 'features/subscriptions/domain/use_cases/get_subscriptoins.dart' as _i57;
import 'features/subscriptions/presentation/bloc/subscriptions_bloc.dart'
    as _i76;
import 'injection.dart' as _i103; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i12.OrdersRemoteDataSource>(
      () => _i13.OrdersRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i14.ProfileRemoteDataSource>(
      () => _i15.ProfileRemoteDataSourceImp(dio: get<_i3.Dio>()));
  await gh.factoryAsync<_i16.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i17.ShowMenuLocalDataSource>(() =>
      _i18.ShowMenuLocalDataSourceImp(
          sharedPreferences: get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i19.ShowMenuRemoteDataSource>(
      () => _i20.ShowMenuRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i21.ShowMenuRepository>(() => _i22.ShowMenuRepositoryImp(
      get<_i19.ShowMenuRemoteDataSource>(), get<_i17.ShowMenuLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i23.SplashLocalDataSource>(() =>
      _i24.SplashLocalDataSourceImp(
          sharedPreferences: get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i25.SplashRemoteDataSource>(
      () => _i26.SplashRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i27.SubscriptionsLocalDataSource>(() =>
      _i28.SubscriptionsLocalDataSourceImp(
          sharedPreferences: get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i29.SubscriptionsRemoteDataSource>(
      () => _i30.SubscriptionsRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i31.SubscriptionsRepository>(() =>
      _i32.SubscriptionsRepositoryImp(get<_i29.SubscriptionsRemoteDataSource>(),
          get<_i27.SubscriptionsLocalDataSource>(),
          networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i33.AddMealLocalDataSource>(() =>
      _i34.AddMealLocalDataSourceImp(get<_i8.ImagePicker>(),
          sharedPreferences: get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i35.AddMealRemoteDataSource>(
      () => _i36.AddMealRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i37.AddNewSubscriptionUseCase>(() =>
      _i37.AddNewSubscriptionUseCase(get<_i31.SubscriptionsRepository>()));
  gh.lazySingleton<_i38.AuthLocalDataSource>(() => _i39.AuthLocalDataSourceImp(
      sharedPreferences: get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i40.AuthRemoteDataSource>(
      () => _i41.AuthRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i42.AuthRepository>(() => _i43.AuthRepositoryImp(
      get<_i38.AuthLocalDataSource>(), get<_i40.AuthRemoteDataSource>()));
  gh.lazySingleton<_i44.BaseLocalDataSource>(() => _i44.BaseLocalDataSourceImpl(
      sharedPreferences: get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i45.BaseRepository>(() => _i45.BaseRepositoryImpl(
      baseLocalDataSource: get<_i44.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i46.ChangeMealAvailabilityUseCase>(
      () => _i46.ChangeMealAvailabilityUseCase(get<_i21.ShowMenuRepository>()));
  gh.lazySingleton<_i47.CheckCodeUseCase>(
      () => _i47.CheckCodeUseCase(get<_i42.AuthRepository>()));
  gh.lazySingleton<_i48.DecreaseMaxMealNumberUseCase>(
      () => _i48.DecreaseMaxMealNumberUseCase(get<_i21.ShowMenuRepository>()));
  gh.lazySingleton<_i49.DeleteMealUseCase>(
      () => _i49.DeleteMealUseCase(get<_i21.ShowMenuRepository>()));
  gh.lazySingleton<_i50.DeleteSubscriptionUseCase>(() =>
      _i50.DeleteSubscriptionUseCase(get<_i31.SubscriptionsRepository>()));
  gh.lazySingleton<_i51.EditSubscriptionAvailabilityUseCase>(() =>
      _i51.EditSubscriptionAvailabilityUseCase(
          get<_i31.SubscriptionsRepository>()));
  gh.lazySingleton<_i52.EditSubscriptionUseCase>(
      () => _i52.EditSubscriptionUseCase(get<_i31.SubscriptionsRepository>()));
  gh.lazySingleton<_i53.GetActiveMealsUseCase>(
      () => _i53.GetActiveMealsUseCase(get<_i21.ShowMenuRepository>()));
  gh.lazySingleton<_i54.GetCategoriesUseCase>(
      () => _i54.GetCategoriesUseCase(get<_i21.ShowMenuRepository>()));
  gh.lazySingleton<_i55.GetCategoryMealsUseCase>(
      () => _i55.GetCategoryMealsUseCase(get<_i21.ShowMenuRepository>()));
  gh.lazySingleton<_i56.GetChefMealsUseCase>(
      () => _i56.GetChefMealsUseCase(get<_i31.SubscriptionsRepository>()));
  gh.lazySingleton<_i57.GetSubscriptionsUseCase>(
      () => _i57.GetSubscriptionsUseCase(get<_i31.SubscriptionsRepository>()));
  gh.lazySingleton<_i58.HomeLocalDataSource>(() => _i59.HomeLocalDataSourceImp(
      sharedPreferences: get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i60.HomeRepository>(() => _i61.HomeRepositoryImp(
      get<_i6.HomeRemoteDataSource>(), get<_i58.HomeLocalDataSource>(),
      baseLocalDataSource: get<_i44.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i62.IncreaseMaxMealNumberUseCase>(
      () => _i62.IncreaseMaxMealNumberUseCase(get<_i21.ShowMenuRepository>()));
  gh.lazySingleton<_i63.OrdersLocalDataSource>(() =>
      _i64.OrdersLocalDataSourceImp(
          sharedPreferences: get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i65.OrdersRepository>(() => _i66.OrderRepositoryImp(
      get<_i63.OrdersLocalDataSource>(), get<_i12.OrdersRemoteDataSource>()));
  gh.lazySingleton<_i67.ProfileLocalDataSource>(() =>
      _i68.ProfileLocalDataSourceImp(get<_i8.ImagePicker>(),
          sharedPreferences: get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i69.ProfileRepository>(() => _i70.ProfileRepositoryImp(
      get<_i67.ProfileLocalDataSource>(), get<_i14.ProfileRemoteDataSource>(),
      baseLocalDataSource: get<_i44.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i71.RequestRegisterUseCase>(
      () => _i71.RequestRegisterUseCase(get<_i42.AuthRepository>()));
  gh.lazySingleton<_i72.SendCodeUseCase>(
      () => _i72.SendCodeUseCase(get<_i42.AuthRepository>()));
  gh.factory<_i73.ShowMenuBloc>(() => _i73.ShowMenuBloc(
      get<_i54.GetCategoriesUseCase>(),
      get<_i53.GetActiveMealsUseCase>(),
      get<_i55.GetCategoryMealsUseCase>(),
      get<_i49.DeleteMealUseCase>(),
      get<_i46.ChangeMealAvailabilityUseCase>(),
      get<_i62.IncreaseMaxMealNumberUseCase>(),
      get<_i48.DecreaseMaxMealNumberUseCase>()));
  gh.lazySingleton<_i74.SplashRepository>(() => _i75.SplashRepositoryImp(
      get<_i23.SplashLocalDataSource>(), get<_i25.SplashRemoteDataSource>(),
      baseLocalDataSource: get<_i44.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.factory<_i76.SubscriptionsBloc>(() => _i76.SubscriptionsBloc(
      get<_i57.GetSubscriptionsUseCase>(),
      get<_i50.DeleteSubscriptionUseCase>(),
      get<_i51.EditSubscriptionAvailabilityUseCase>(),
      get<_i56.GetChefMealsUseCase>(),
      get<_i37.AddNewSubscriptionUseCase>(),
      get<_i52.EditSubscriptionUseCase>()));
  gh.lazySingleton<_i77.AddMealRepository>(() => _i78.AddMealRepoImp(
      get<_i33.AddMealLocalDataSource>(), get<_i35.AddMealRemoteDataSource>(),
      baseLocalDataSource: get<_i44.BaseLocalDataSource>(),
      networkInfo: get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i79.AddMealUseCase>(
      () => _i79.AddMealUseCase(get<_i77.AddMealRepository>()));
  gh.factory<_i80.AuthBloc>(() => _i80.AuthBloc(
      get<_i47.CheckCodeUseCase>(),
      get<_i71.RequestRegisterUseCase>(),
      get<_i72.SendCodeUseCase>(),
      get<_i10.Location>(),
      get<_i4.FilePicker>()));
  gh.lazySingleton<_i81.ChangeProfilePictureUseCase>(
      () => _i81.ChangeProfilePictureUseCase(get<_i69.ProfileRepository>()));
  gh.lazySingleton<_i82.ChangeStatusUseCase>(
      () => _i82.ChangeStatusUseCase(get<_i65.OrdersRepository>()));
  gh.lazySingleton<_i83.CheckAuthUseCase>(
      () => _i83.CheckAuthUseCase(get<_i74.SplashRepository>()));
  gh.lazySingleton<_i84.EditDeliverTimeUseCase>(
      () => _i84.EditDeliverTimeUseCase(get<_i69.ProfileRepository>()));
  gh.lazySingleton<_i85.EditMaxMealsPerDayUseCase>(
      () => _i85.EditMaxMealsPerDayUseCase(get<_i69.ProfileRepository>()));
  gh.lazySingleton<_i86.EditMealUseCase>(
      () => _i86.EditMealUseCase(get<_i77.AddMealRepository>()));
  gh.lazySingleton<_i87.GetChefBalanceUseCase>(
      () => _i87.GetChefBalanceUseCase(get<_i69.ProfileRepository>()));
  gh.lazySingleton<_i88.GetFinalPriceUseCase>(
      () => _i88.GetFinalPriceUseCase(get<_i77.AddMealRepository>()));
  gh.lazySingleton<_i89.GetFinalPriceUseCase>(
      () => _i89.GetFinalPriceUseCase(get<_i77.AddMealRepository>()));
  gh.lazySingleton<_i90.GetOrderMealsNotesUseCase>(
      () => _i90.GetOrderMealsNotesUseCase(get<_i69.ProfileRepository>()));
  gh.lazySingleton<_i91.GetOrdersHistoryUseCase>(
      () => _i91.GetOrdersHistoryUseCase(get<_i69.ProfileRepository>()));
  gh.lazySingleton<_i92.GetOrdersTimesUseCase>(
      () => _i92.GetOrdersTimesUseCase(get<_i65.OrdersRepository>()));
  gh.lazySingleton<_i93.GetProfileUseCase>(
      () => _i93.GetProfileUseCase(get<_i69.ProfileRepository>()));
  gh.lazySingleton<_i94.GetTimeOrdersUseCase>(
      () => _i94.GetTimeOrdersUseCase(get<_i65.OrdersRepository>()));
  gh.lazySingleton<_i95.LogoutUseCase>(
      () => _i95.LogoutUseCase(get<_i69.ProfileRepository>()));
  gh.factory<_i96.OrdersBloc>(() => _i96.OrdersBloc(
      get<_i92.GetOrdersTimesUseCase>(),
      get<_i94.GetTimeOrdersUseCase>(),
      get<_i82.ChangeStatusUseCase>()));
  gh.lazySingleton<_i97.PickImageUseCase>(
      () => _i97.PickImageUseCase(get<_i77.AddMealRepository>()));
  gh.lazySingleton<_i98.PickImageUseCase>(
      () => _i98.PickImageUseCase(get<_i69.ProfileRepository>()));
  gh.factory<_i99.ProfileBloc>(() => _i99.ProfileBloc(
      get<_i81.ChangeProfilePictureUseCase>(),
      get<_i95.LogoutUseCase>(),
      get<_i90.GetOrderMealsNotesUseCase>(),
      get<_i91.GetOrdersHistoryUseCase>(),
      get<_i84.EditDeliverTimeUseCase>(),
      get<_i87.GetChefBalanceUseCase>(),
      get<_i93.GetProfileUseCase>(),
      get<_i85.EditMaxMealsPerDayUseCase>(),
      get<_i97.PickImageUseCase>()));
  gh.factory<_i100.SplashBloc>(
      () => _i100.SplashBloc(get<_i83.CheckAuthUseCase>()));
  gh.lazySingleton<_i101.AddCategoryUseCase>(
      () => _i101.AddCategoryUseCase(get<_i77.AddMealRepository>()));
  gh.factory<_i102.AddMealBloc>(() => _i102.AddMealBloc(
      get<_i97.PickImageUseCase>(),
      get<_i54.GetCategoriesUseCase>(),
      get<_i101.AddCategoryUseCase>(),
      get<_i79.AddMealUseCase>(),
      get<_i89.GetFinalPriceUseCase>(),
      get<_i86.EditMealUseCase>()));
  return get;
}

class _$RegisterModule extends _i103.RegisterModule {}
