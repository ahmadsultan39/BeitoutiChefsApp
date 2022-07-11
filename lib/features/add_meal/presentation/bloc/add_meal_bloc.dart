import 'package:beitouti_chefs/features/add_meal/domain/use_cases/add_category.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/add_meal.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/get_final_price.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/pick_image.dart';
import 'package:beitouti_chefs/features/show_menu/domain/use_cases/get_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/use_cases/edit_meal.dart';
import 'add_meal.dart';

@injectable
class AddMealBloc extends Bloc<AddMealEvent, AddMealState> {
  final PickImageUseCase pickImageUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final AddCategoryUseCase addCategoryUseCase;
  final AddMealUseCase addMealUseCase;
  final GetFinalPriceUseCase getFinalPriceUseCase;
  final EditMealUseCase editMealUseCase;

  void addPickImageEvent() {
    add(PickImage((b) => b));
  }

  void addGetCategoriesEvent() {
    add(GetCategoriesEvent((b) => b));
  }

  void addAddCategoryEvent(String name) {
    add(AddCategoryEvent((b) => b..name = name));
  }

  void addAddNewMealEvent(AddMealUseCaseParams params) {
    add(AddNewMealEvent((b) => b..mealData = params));
  }

  void addEditMealEvent(EditMealUseCaseParams params) {
    add(EditMealEvent((b) => b..mealData = params));
  }

  void addGetFinalPriceEvent(int price) {
    add(GetFinalPriceEvent((b) => b..price = price));
  }

  void clearError() {
    add(ClearError((b) => b));
  }

  @factoryMethod
  AddMealBloc(this.pickImageUseCase, this.getCategoriesUseCase,
      this.addCategoryUseCase, this.addMealUseCase, this.getFinalPriceUseCase, this.editMealUseCase)
      : super(AddMealState.initial()) {
    on<AddMealEvent>((event, emit) async {
      /***** PickImage *****/
      if (event is PickImage) {
        final result = await pickImageUseCase(NoParams());

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..error = true
              ..message = failure.error,
          ));
        }, (image) {
          emit(
            state.rebuild(
              (b) => b..pickedImage = image,
            ),
          );
        });
      }

      /***** Get Categories *****/
      if (event is GetCategoriesEvent) {
        emit(state.rebuild((b) => b..isCategoriesLoading = true));
        final result = await getCategoriesUseCase(NoParams());

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isCategoriesLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (categories) {
          emit(
            state.rebuild(
              (b) => b
                ..isCategoriesLoading = false
                ..categories = categories,
            ),
          );
        });
      }

      /***** Add Category *****/
      if (event is AddCategoryEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await addCategoryUseCase(
            AddCategoryUseCaseParams(name: event.name));

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (category) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..categories!.add(category),
            ),
          );
        });
      }

      /***** Get Final Price *****/
      if (event is GetFinalPriceEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await getFinalPriceUseCase(
            GetFinalPriceUseCaseParams(price: event.price));

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (finalPrice) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
              ..finalPrice = finalPrice,
            ),
          );
        });
      }

      /***** Add Meal *****/
      if (event is AddNewMealEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await addMealUseCase(event.mealData);

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (_) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = false,
            ),
          );
        });
      }

      /***** Edit Meal *****/
      if (event is EditMealEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await editMealUseCase(event.mealData);

        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (_) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = false,
            ),
          );
        });
      }

      /***** ClearError *****/
      if (event is ClearError) {
        emit(state.rebuild((b) => b
          ..error = false
          ..message = ''));
      }
    });
  }
}
