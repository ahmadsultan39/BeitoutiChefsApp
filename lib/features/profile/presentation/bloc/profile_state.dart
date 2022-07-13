import 'package:beitouti_chefs/core/bloc/base_state.dart';
import 'package:beitouti_chefs/features/profile/domain/entities/chef_balance.dart';
import 'package:beitouti_chefs/features/profile/domain/entities/order_meal_note.dart';
import 'package:beitouti_chefs/features/profile/domain/entities/prepared_order.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import '../../domain/entities/profile.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  String get message;

  bool get error;

  bool get isLoading;

  bool get isLoggedOut;

  ProfilePagesState get profilePagesState;

  BuiltList<OrderMealNote> get orderMealsNotes;

  BuiltList<PreparedOrder> get preparedOrder;

  ChefBalance? get chefBalance;

  Profile? get profile;

  ProfileState._();

  factory ProfileState([Function(ProfileStateBuilder b) updates]) =
      _$ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
      (b) => b
        ..isLoading = false
        ..message = ""
        ..error = false
        ..isLoggedOut = false
        ..chefBalance = null
        ..profile = null
        ..preparedOrder.replace([])
        ..orderMealsNotes.replace([])
        ..profilePagesState = ProfilePagesState(
          mealsNotesPageState: BaseState.initial(),
          editProfilePageState: BaseState.initial(),
          orderHistoryPageState: BaseState.initial(),
        ),
    );
  }
}

class ProfilePagesState {
  final BaseState orderHistoryPageState;
  final BaseState mealsNotesPageState;
  final BaseState editProfilePageState;

  ProfilePagesState({
    required this.orderHistoryPageState,
    required this.mealsNotesPageState,
    required this.editProfilePageState,
  });
}
