// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:file_picker/file_picker.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:location/location.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import 'core/data/base_local_data_source.dart' as _i43;
import 'core/data/base_repository.dart' as _i44;
import 'core/network/network_info.dart' as _i10;
import 'features/add_meal/data/data_sources/local/add_meal_local_data_source.dart'
    as _i32;
import 'features/add_meal/data/data_sources/local/add_meal_local_data_source_imp.dart'
    as _i33;
import 'features/add_meal/data/data_sources/remote/add_meal_remote_data_source.dart'
    as _i34;
import 'features/add_meal/data/data_sources/remote/add_meal_remote_data_source_imp.dart'
    as _i35;
import 'features/add_meal/data/repositories/add_meal_repo_imp.dart' as _i77;
import 'features/add_meal/domain/repositories/add_meal_repository.dart' as _i76;
import 'features/add_meal/domain/use_cases/add_category.dart' as _i103;
import 'features/add_meal/domain/use_cases/add_meal.dart' as _i78;
import 'features/add_meal/domain/use_cases/edit_meal.dart' as _i86;
import 'features/add_meal/domain/use_cases/get_categories.dart' as _i90;
import 'features/add_meal/domain/use_cases/get_final_price.dart' as _i89;
import 'features/add_meal/domain/use_cases/pick_image.dart' as _i100;
import 'features/add_meal/presentation/bloc/add_meal_bloc.dart' as _i104;
import 'features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i37;
import 'features/auth/data/data_sources/local/auth_local_data_source_imp.dart'
    as _i38;
import 'features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i39;
import 'features/auth/data/data_sources/remote/auth_remote_data_source_imp.dart'
    as _i40;
import 'features/auth/data/repositories/auth_repository_imp.dart' as _i42;
import 'features/auth/domain/repositories/auth_repository.dart' as _i41;
import 'features/auth/domain/use_cases/check_code_use_case.dart' as _i46;
import 'features/auth/domain/use_cases/request_register_use_case.dart' as _i70;
import 'features/auth/domain/use_cases/send_code_use_case.dart' as _i71;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i79;
import 'features/home/data/data_sources/local/home_local_data_source.dart'
    as _i57;
import 'features/home/data/data_sources/local/home_local_data_source_imp.dart'
    as _i58;
import 'features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i5;
import 'features/home/data/data_sources/remote/home_remote_data_source_imp.dart'
    as _i6;
import 'features/home/data/repositories/home_repository_imp.dart' as _i60;
import 'features/home/domain/repositories/home_repository.dart' as _i59;
import 'features/home/domain/use_cases/change_availability_use_case.dart'
    as _i80;
import 'features/home/domain/use_cases/get_availability_status_use_case.dart'
    as _i87;
import 'features/home/presentation/bloc/home_bloc.dart' as _i96;
import 'features/orders/data/data_sources/local/orders_local_data_source.dart'
    as _i62;
import 'features/orders/data/data_sources/local/orders_local_data_source_imp.dart'
    as _i63;
import 'features/orders/data/data_sources/remote/orders_remote_data_source.dart'
    as _i11;
import 'features/orders/data/data_sources/remote/orders_remote_data_source_imp.dart'
    as _i12;
import 'features/orders/data/repositories/orders_repository_imp.dart' as _i65;
import 'features/orders/domain/repositories/orders_repository.dart' as _i64;
import 'features/orders/domain/use_cases/change_status.dart' as _i82;
import 'features/orders/domain/use_cases/get_orders_times.dart' as _i93;
import 'features/orders/domain/use_cases/get_time_order.dart' as _i95;
import 'features/orders/presentation/bloc/orders_bloc.dart' as _i98;
import 'features/profile/data/data_sources/local/profile_local_data_source.dart'
    as _i66;
import 'features/profile/data/data_sources/local/profile_local_data_source_imp.dart'
    as _i67;
import 'features/profile/data/data_sources/remote/profile_remote_data_source.dart'
    as _i13;
import 'features/profile/data/data_sources/remote/profile_remote_data_source_imp.dart'
    as _i14;
import 'features/profile/data/repositories/profile_repository_imp.dart' as _i69;
import 'features/profile/domain/repositories/profile_repository.dart' as _i68;
import 'features/profile/domain/use_cases/change_profile_picture_use_case.dart'
    as _i81;
import 'features/profile/domain/use_cases/edit_deliver_meal_time_use_case.dart'
    as _i84;
import 'features/profile/domain/use_cases/edit_max_meals_per_day_use_case.dart'
    as _i85;
import 'features/profile/domain/use_cases/get_chef_balance_use_case.dart'
    as _i88;
import 'features/profile/domain/use_cases/get_order_meals_notes.dart' as _i91;
import 'features/profile/domain/use_cases/get_orders_history_use_case.dart'
    as _i92;
import 'features/profile/domain/use_cases/get_profile_use_case.dart' as _i94;
import 'features/profile/domain/use_cases/logout_use_case.dart' as _i97;
import 'features/profile/domain/use_cases/pick_image_use_case.dart' as _i99;
import 'features/profile/presentation/bloc/profile_bloc.dart' as _i101;
import 'features/show_menu/data/data_sources/local/show_menu_local_data_source.dart'
    as _i16;
import 'features/show_menu/data/data_sources/local/show_menu_local_data_source_imp.dart'
    as _i17;
import 'features/show_menu/data/data_sources/remote/show_menu_remote_data_source.dart'
    as _i18;
import 'features/show_menu/data/data_sources/remote/show_menu_remote_data_source_imp.dart'
    as _i19;
import 'features/show_menu/data/repositories/show_menu_imp.dart' as _i21;
import 'features/show_menu/domain/repositories/show_menu.dart' as _i20;
import 'features/show_menu/domain/use_cases/change_meal_availability.dart'
    as _i45;
import 'features/show_menu/domain/use_cases/decrease_max_meal_number.dart'
    as _i47;
import 'features/show_menu/domain/use_cases/delete_meal.dart' as _i48;
import 'features/show_menu/domain/use_cases/get_active_meals_count.dart'
    as _i52;
import 'features/show_menu/domain/use_cases/get_categories.dart' as _i53;
import 'features/show_menu/domain/use_cases/get_category_meals.dart' as _i54;
import 'features/show_menu/domain/use_cases/increase_max_meal_number.dart'
    as _i61;
import 'features/show_menu/presentation/bloc/show_menu_bloc.dart' as _i72;
import 'features/splash/data/data_sources/local/splash_local_data_source.dart'
    as _i22;
import 'features/splash/data/data_sources/local/splash_local_data_source_imp.dart'
    as _i23;
import 'features/splash/data/data_sources/remote/splash_remote_data_source.dart'
    as _i24;
import 'features/splash/data/data_sources/remote/splash_remote_data_source_imp.dart'
    as _i25;
import 'features/splash/data/repositories/splash_repository_imp.dart' as _i74;
import 'features/splash/domain/repositories/splash_repository.dart' as _i73;
import 'features/splash/domain/use_cases/check_auth_use_case.dart' as _i83;
import 'features/splash/presentation/bloc/splash_bloc.dart' as _i102;
import 'features/subscriptions/data/data_sources/local/subscriptions_local_data_source.dart'
    as _i26;
import 'features/subscriptions/data/data_sources/local/subscriptions_local_data_source_imp.dart'
    as _i27;
import 'features/subscriptions/data/data_sources/remote/subscriptions_remote_data_source.dart'
    as _i28;
import 'features/subscriptions/data/data_sources/remote/subscriptions_remote_data_source_imp.dart'
    as _i29;
import 'features/subscriptions/data/repositories/subscriptions_repository_imp.dart'
    as _i31;
import 'features/subscriptions/domain/repositories/subscriptions_repository.dart'
    as _i30;
import 'features/subscriptions/domain/use_cases/add_new_subscription.dart'
    as _i36;
import 'features/subscriptions/domain/use_cases/delete_subscription.dart'
    as _i49;
import 'features/subscriptions/domain/use_cases/edit_subscription.dart' as _i51;
import 'features/subscriptions/domain/use_cases/edit_subscription_availability.dart'
    as _i50;
import 'features/subscriptions/domain/use_cases/get_chef_meals.dart' as _i55;
import 'features/subscriptions/domain/use_cases/get_subscriptoins.dart' as _i56;
import 'features/subscriptions/presentation/bloc/subscriptions_bloc.dart'
    as _i75;
import 'injection.dart' as _i105; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.FilePicker>(() => registerModule.filePicker);
  gh.lazySingleton<_i5.HomeRemoteDataSource>(
      () => _i6.HomeRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i7.ImagePicker>(() => registerModule.picker);
  gh.lazySingleton<_i8.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i9.Location>(() => registerModule.location);
  gh.lazySingleton<_i10.NetworkInfo>(
      () => _i10.NetworkInfoImpl(get<_i8.InternetConnectionChecker>()));
  gh.lazySingleton<_i11.OrdersRemoteDataSource>(
      () => _i12.OrdersRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i13.ProfileRemoteDataSource>(
      () => _i14.ProfileRemoteDataSourceImp(dio: get<_i3.Dio>()));
  await gh.factoryAsync<_i15.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i16.ShowMenuLocalDataSource>(() =>
      _i17.ShowMenuLocalDataSourceImp(
          sharedPreferences: get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i18.ShowMenuRemoteDataSource>(
      () => _i19.ShowMenuRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i20.ShowMenuRepository>(() => _i21.ShowMenuRepositoryImp(
      get<_i18.ShowMenuRemoteDataSource>(), get<_i16.ShowMenuLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i22.SplashLocalDataSource>(() =>
      _i23.SplashLocalDataSourceImp(
          sharedPreferences: get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i24.SplashRemoteDataSource>(
      () => _i25.SplashRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i26.SubscriptionsLocalDataSource>(() =>
      _i27.SubscriptionsLocalDataSourceImp(
          sharedPreferences: get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i28.SubscriptionsRemoteDataSource>(
      () => _i29.SubscriptionsRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i30.SubscriptionsRepository>(() =>
      _i31.SubscriptionsRepositoryImp(get<_i28.SubscriptionsRemoteDataSource>(),
          get<_i26.SubscriptionsLocalDataSource>(),
          networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i32.AddMealLocalDataSource>(() =>
      _i33.AddMealLocalDataSourceImp(get<_i7.ImagePicker>(),
          sharedPreferences: get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i34.AddMealRemoteDataSource>(
      () => _i35.AddMealRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i36.AddNewSubscriptionUseCase>(() =>
      _i36.AddNewSubscriptionUseCase(get<_i30.SubscriptionsRepository>()));
  gh.lazySingleton<_i37.AuthLocalDataSource>(() => _i38.AuthLocalDataSourceImp(
      sharedPreferences: get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i39.AuthRemoteDataSource>(
      () => _i40.AuthRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i41.AuthRepository>(() => _i42.AuthRepositoryImp(
      get<_i37.AuthLocalDataSource>(), get<_i39.AuthRemoteDataSource>()));
  gh.lazySingleton<_i43.BaseLocalDataSource>(() => _i43.BaseLocalDataSourceImpl(
      sharedPreferences: get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i44.BaseRepository>(() => _i44.BaseRepositoryImpl(
      baseLocalDataSource: get<_i43.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i45.ChangeMealAvailabilityUseCase>(
      () => _i45.ChangeMealAvailabilityUseCase(get<_i20.ShowMenuRepository>()));
  gh.lazySingleton<_i46.CheckCodeUseCase>(
      () => _i46.CheckCodeUseCase(get<_i41.AuthRepository>()));
  gh.lazySingleton<_i47.DecreaseMaxMealNumberUseCase>(
      () => _i47.DecreaseMaxMealNumberUseCase(get<_i20.ShowMenuRepository>()));
  gh.lazySingleton<_i48.DeleteMealUseCase>(
      () => _i48.DeleteMealUseCase(get<_i20.ShowMenuRepository>()));
  gh.lazySingleton<_i49.DeleteSubscriptionUseCase>(() =>
      _i49.DeleteSubscriptionUseCase(get<_i30.SubscriptionsRepository>()));
  gh.lazySingleton<_i50.EditSubscriptionAvailabilityUseCase>(() =>
      _i50.EditSubscriptionAvailabilityUseCase(
          get<_i30.SubscriptionsRepository>()));
  gh.lazySingleton<_i51.EditSubscriptionUseCase>(
      () => _i51.EditSubscriptionUseCase(get<_i30.SubscriptionsRepository>()));
  gh.lazySingleton<_i52.GetActiveMealsUseCase>(
      () => _i52.GetActiveMealsUseCase(get<_i20.ShowMenuRepository>()));
  gh.lazySingleton<_i53.GetCategoriesUseCase>(
      () => _i53.GetCategoriesUseCase(get<_i20.ShowMenuRepository>()));
  gh.lazySingleton<_i54.GetCategoryMealsUseCase>(
      () => _i54.GetCategoryMealsUseCase(get<_i20.ShowMenuRepository>()));
  gh.lazySingleton<_i55.GetChefMealsUseCase>(
      () => _i55.GetChefMealsUseCase(get<_i30.SubscriptionsRepository>()));
  gh.lazySingleton<_i56.GetSubscriptionsUseCase>(
      () => _i56.GetSubscriptionsUseCase(get<_i30.SubscriptionsRepository>()));
  gh.lazySingleton<_i57.HomeLocalDataSource>(() => _i58.HomeLocalDataSourceImp(
      sharedPreferences: get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i59.HomeRepository>(() => _i60.HomeRepositoryImp(
      get<_i5.HomeRemoteDataSource>(), get<_i57.HomeLocalDataSource>(),
      baseLocalDataSource: get<_i43.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i61.IncreaseMaxMealNumberUseCase>(
      () => _i61.IncreaseMaxMealNumberUseCase(get<_i20.ShowMenuRepository>()));
  gh.lazySingleton<_i62.OrdersLocalDataSource>(() =>
      _i63.OrdersLocalDataSourceImp(
          sharedPreferences: get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i64.OrdersRepository>(() => _i65.OrderRepositoryImp(
      get<_i62.OrdersLocalDataSource>(), get<_i11.OrdersRemoteDataSource>()));
  gh.lazySingleton<_i66.ProfileLocalDataSource>(() =>
      _i67.ProfileLocalDataSourceImp(get<_i7.ImagePicker>(),
          sharedPreferences: get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i68.ProfileRepository>(() => _i69.ProfileRepositoryImp(
      get<_i66.ProfileLocalDataSource>(), get<_i13.ProfileRemoteDataSource>(),
      baseLocalDataSource: get<_i43.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i70.RequestRegisterUseCase>(
      () => _i70.RequestRegisterUseCase(get<_i41.AuthRepository>()));
  gh.lazySingleton<_i71.SendCodeUseCase>(
      () => _i71.SendCodeUseCase(get<_i41.AuthRepository>()));
  gh.factory<_i72.ShowMenuBloc>(() => _i72.ShowMenuBloc(
      get<_i53.GetCategoriesUseCase>(),
      get<_i52.GetActiveMealsUseCase>(),
      get<_i54.GetCategoryMealsUseCase>(),
      get<_i48.DeleteMealUseCase>(),
      get<_i45.ChangeMealAvailabilityUseCase>(),
      get<_i61.IncreaseMaxMealNumberUseCase>(),
      get<_i47.DecreaseMaxMealNumberUseCase>()));
  gh.lazySingleton<_i73.SplashRepository>(() => _i74.SplashRepositoryImp(
      get<_i22.SplashLocalDataSource>(), get<_i24.SplashRemoteDataSource>(),
      baseLocalDataSource: get<_i43.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.factory<_i75.SubscriptionsBloc>(() => _i75.SubscriptionsBloc(
      get<_i56.GetSubscriptionsUseCase>(),
      get<_i49.DeleteSubscriptionUseCase>(),
      get<_i50.EditSubscriptionAvailabilityUseCase>(),
      get<_i55.GetChefMealsUseCase>(),
      get<_i36.AddNewSubscriptionUseCase>(),
      get<_i51.EditSubscriptionUseCase>()));
  gh.lazySingleton<_i76.AddMealRepository>(() => _i77.AddMealRepoImp(
      get<_i32.AddMealLocalDataSource>(), get<_i34.AddMealRemoteDataSource>(),
      baseLocalDataSource: get<_i43.BaseLocalDataSource>(),
      networkInfo: get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i78.AddMealUseCase>(
      () => _i78.AddMealUseCase(get<_i76.AddMealRepository>()));
  gh.factory<_i79.AuthBloc>(() => _i79.AuthBloc(
      get<_i46.CheckCodeUseCase>(),
      get<_i70.RequestRegisterUseCase>(),
      get<_i71.SendCodeUseCase>(),
      get<_i9.Location>(),
      get<_i4.FilePicker>()));
  gh.lazySingleton<_i80.ChangeAvailabilityUseCase>(
      () => _i80.ChangeAvailabilityUseCase(get<_i59.HomeRepository>()));
  gh.lazySingleton<_i81.ChangeProfilePictureUseCase>(
      () => _i81.ChangeProfilePictureUseCase(get<_i68.ProfileRepository>()));
  gh.lazySingleton<_i82.ChangeStatusUseCase>(
      () => _i82.ChangeStatusUseCase(get<_i64.OrdersRepository>()));
  gh.lazySingleton<_i83.CheckAuthUseCase>(
      () => _i83.CheckAuthUseCase(get<_i73.SplashRepository>()));
  gh.lazySingleton<_i84.EditDeliverTimeUseCase>(
      () => _i84.EditDeliverTimeUseCase(get<_i68.ProfileRepository>()));
  gh.lazySingleton<_i85.EditMaxMealsPerDayUseCase>(
      () => _i85.EditMaxMealsPerDayUseCase(get<_i68.ProfileRepository>()));
  gh.lazySingleton<_i86.EditMealUseCase>(
      () => _i86.EditMealUseCase(get<_i76.AddMealRepository>()));
  gh.lazySingleton<_i87.GetAvailabilityStatusUseCase>(
      () => _i87.GetAvailabilityStatusUseCase(get<_i59.HomeRepository>()));
  gh.lazySingleton<_i88.GetChefBalanceUseCase>(
      () => _i88.GetChefBalanceUseCase(get<_i68.ProfileRepository>()));
  gh.lazySingleton<_i89.GetFinalPriceUseCase>(
      () => _i89.GetFinalPriceUseCase(get<_i76.AddMealRepository>()));
  gh.lazySingleton<_i90.GetFinalPriceUseCase>(
      () => _i90.GetFinalPriceUseCase(get<_i76.AddMealRepository>()));
  gh.lazySingleton<_i91.GetOrderMealsNotesUseCase>(
      () => _i91.GetOrderMealsNotesUseCase(get<_i68.ProfileRepository>()));
  gh.lazySingleton<_i92.GetOrdersHistoryUseCase>(
      () => _i92.GetOrdersHistoryUseCase(get<_i68.ProfileRepository>()));
  gh.lazySingleton<_i93.GetOrdersTimesUseCase>(
      () => _i93.GetOrdersTimesUseCase(get<_i64.OrdersRepository>()));
  gh.lazySingleton<_i94.GetProfileUseCase>(
      () => _i94.GetProfileUseCase(get<_i68.ProfileRepository>()));
  gh.lazySingleton<_i95.GetTimeOrdersUseCase>(
      () => _i95.GetTimeOrdersUseCase(get<_i64.OrdersRepository>()));
  gh.lazySingleton<_i96.HomeBloc>(() => _i96.HomeBloc(
      get<_i80.ChangeAvailabilityUseCase>(),
      get<_i87.GetAvailabilityStatusUseCase>()));
  gh.lazySingleton<_i97.LogoutUseCase>(
      () => _i97.LogoutUseCase(get<_i68.ProfileRepository>()));
  gh.factory<_i98.OrdersBloc>(() => _i98.OrdersBloc(
      get<_i93.GetOrdersTimesUseCase>(),
      get<_i95.GetTimeOrdersUseCase>(),
      get<_i82.ChangeStatusUseCase>()));
  gh.lazySingleton<_i99.PickImageUseCase>(
      () => _i99.PickImageUseCase(get<_i68.ProfileRepository>()));
  gh.lazySingleton<_i100.PickImageUseCase>(
      () => _i100.PickImageUseCase(get<_i76.AddMealRepository>()));
  gh.factory<_i101.ProfileBloc>(() => _i101.ProfileBloc(
      get<_i81.ChangeProfilePictureUseCase>(),
      get<_i97.LogoutUseCase>(),
      get<_i91.GetOrderMealsNotesUseCase>(),
      get<_i92.GetOrdersHistoryUseCase>(),
      get<_i84.EditDeliverTimeUseCase>(),
      get<_i88.GetChefBalanceUseCase>(),
      get<_i94.GetProfileUseCase>(),
      get<_i85.EditMaxMealsPerDayUseCase>(),
      get<_i100.PickImageUseCase>()));
  gh.factory<_i102.SplashBloc>(
      () => _i102.SplashBloc(get<_i83.CheckAuthUseCase>()));
  gh.lazySingleton<_i103.AddCategoryUseCase>(
      () => _i103.AddCategoryUseCase(get<_i76.AddMealRepository>()));
  gh.factory<_i104.AddMealBloc>(() => _i104.AddMealBloc(
      get<_i100.PickImageUseCase>(),
      get<_i53.GetCategoriesUseCase>(),
      get<_i103.AddCategoryUseCase>(),
      get<_i78.AddMealUseCase>(),
      get<_i89.GetFinalPriceUseCase>(),
      get<_i86.EditMealUseCase>()));
  return get;
}

class _$RegisterModule extends _i105.RegisterModule {}
