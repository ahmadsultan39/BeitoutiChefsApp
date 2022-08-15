import 'package:beitouti_chefs/core/bloc/base_state.dart';
import 'package:beitouti_chefs/core/entities/pagination_state_data.dart';
import 'package:beitouti_chefs/features/profile/domain/entities/chef_balance.dart';
import 'package:beitouti_chefs/features/profile/domain/entities/order_meal_note.dart';
import 'package:beitouti_chefs/features/profile/domain/entities/prepared_order.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/profile.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  String get message;

  bool get error;

  bool get isLoading;

  bool get isLoggedOut;

  XFile? get pickedImage;

  PaginationStateData<PreparedOrder> get preparedOrder;

  BuiltList<OrderMealNote> get orderMealsNotes;

  ChefBalance? get chefBalance;

  Profile? get profile;

  bool get pop;

  ProfileState._();

  factory ProfileState([Function(ProfileStateBuilder b) updates]) =
      _$ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
      (b) => b
        ..isLoading = false
        ..message = ""
        ..error = false
        ..pop = false
        ..isLoggedOut = false
        ..chefBalance = null
        ..profile = null
        ..pickedImage = null
        ..orderMealsNotes.replace([])
        ..preparedOrder.replace(PaginationStateData<PreparedOrder>.initial()),
    );
  }
}
