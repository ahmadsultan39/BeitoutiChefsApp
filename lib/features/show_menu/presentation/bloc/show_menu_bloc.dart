import 'package:beitouti_chefs/features/show_menu/domain/use_cases/change_meal_availability.dart';
import 'package:beitouti_chefs/features/show_menu/domain/use_cases/delete_meal.dart';
import 'package:beitouti_chefs/features/show_menu/domain/use_cases/get_active_meals_count.dart';
import 'package:beitouti_chefs/features/show_menu/domain/use_cases/get_categories.dart';
import 'package:beitouti_chefs/features/show_menu/domain/use_cases/get_category_meals.dart';
import 'package:beitouti_chefs/features/show_menu/domain/use_cases/increase_max_meal_number.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/use_cases/decrease_max_meal_number.dart';
import 'show_menu.dart';

@injectable
class ShowMenuBloc extends Bloc<ShowMenuEvent, ShowMenuState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetActiveMealsUseCase getActiveMealsUseCase;
  final GetCategoryMealsUseCase getCategoryMealsUseCase;
  final DeleteMealUseCase deleteMealUseCase;
  final ChangeMealAvailabilityUseCase changeMealAvailabilityUseCase;
  final IncreaseMaxMealNumberUseCase increaseMaxMealNumberUseCase;
  final DecreaseMaxMealNumberUseCase decreaseMaxMealNumberUseCase;

  void addGetCategoriesEvent() {
    add(GetCategoriesEvent());
  }

  void addGetActiveMealsCountEvent() {
    add(GetActiveMealsCountEvent());
  }

  void addGetCategoryMealsEvent(int categoryId) {
    add(GetCategoryMealsEvent((b) => b..categoryId = categoryId));
  }

  void addDeleteMealEvent(int mealId, int categoryId) {
    add(DeleteMealEvent((b) => b..mealId = mealId..categoryId = categoryId));
  }

  void addChangeMealAvailabilityEvent(int mealId, int categoryId) {
    add(ChangeMealAvailabilityEvent((b) => b
      ..mealId = mealId
      ..categoryId = categoryId));
  }

  void addDecreaseMaxMealNumberEvent(int mealId, int categoryId) {
    add(DecreaseMaxMealNumberEvent((b) => b
      ..mealId = mealId
      ..categoryId = categoryId));
  }

  void addIncreaseMaxMealNumberEvent(int mealId, int categoryId) {
    add(IncreaseMaxMealNumberEvent((b) => b
      ..mealId = mealId
      ..categoryId = categoryId));
  }

  void clearMessage() {
    add(ClearMessage());
  }


  @factoryMethod
  ShowMenuBloc(
    this.getCategoriesUseCase,
    this.getActiveMealsUseCase,
    this.getCategoryMealsUseCase,
    this.deleteMealUseCase,
    this.changeMealAvailabilityUseCase,
    this.increaseMaxMealNumberUseCase,
    this.decreaseMaxMealNumberUseCase,
  ) : super(ShowMenuState.initial()) {
    on<ShowMenuEvent>((event, emit) async {
      /***** Get Categories *****/
      if (event is GetCategoriesEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await getCategoriesUseCase(NoParams());

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (categories) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..categories = categories,
            ),
          );
        });
      }

      /***** Get Meals Info *****/
      if (event is GetActiveMealsCountEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await getActiveMealsUseCase(NoParams());

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (mealsInfo) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..mealsInfo = mealsInfo,
            ),
          );
        });
      }

      /***** Get Category Meals *****/
      if (event is GetCategoryMealsEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await getCategoryMealsUseCase(
            GetCategoryMealsUseCaseParams(categoryId: event.categoryId));

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (meals) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..meals!.update(event.categoryId, (value) => BuiltList.from(meals),ifAbsent: () => BuiltList.from(meals))
                    ,
            ),
          );
        });
      }

      /***** Change Meal Availability *****/
      if (event is ChangeMealAvailabilityEvent) {
        emit(state.rebuild(
          (b) => b..isLoading = true,
        ));
        final result = await changeMealAvailabilityUseCase(
            ChangeMealAvailabilityUseCaseParams(mealId: event.mealId));

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
            ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (_) {
          addGetCategoryMealsEvent(event.categoryId);
          addGetActiveMealsCountEvent();
        });
      }

      /***** Increase Meal Max *****/
      if (event is IncreaseMaxMealNumberEvent) {
        emit(state.rebuild((b) => b
          ..isLoading = true));
        final result = await increaseMaxMealNumberUseCase(
            IncreaseMaxMealNumberUseCaseParams(mealId: event.mealId));

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
            ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (_) {
          addGetCategoryMealsEvent(event.categoryId);
        });
      }

      /***** Decrease Meal Max *****/
      if (event is DecreaseMaxMealNumberEvent) {
        emit(state.rebuild((b) => b..isLoading = true
              ));
        final result = await decreaseMaxMealNumberUseCase(
            DecreaseMaxMealNumberUseCaseParams(mealId: event.mealId));

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
            ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (_) {
          addGetCategoryMealsEvent(event.categoryId);
        });
      }

      /***** Delete Meal *****/
      if (event is DeleteMealEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await deleteMealUseCase(
            DeleteMealUseCaseParams(mealId: event.mealId));

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (_) {
          addGetCategoryMealsEvent(event.categoryId);
        });
      }

      /// *** ClearMessage *** //
      if (event is ClearMessage) {
        emit(
          state.rebuild(
                (b) => b
              ..error = false
              ..message = '',
          ),
        );
      }
    });
  }
}
