import 'package:built_value/built_value.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_event.g.dart';

abstract class ProfileEvent {}

/// ChangeProfilePicture
abstract class ChangeProfilePicture extends ProfileEvent
    implements Built<ChangeProfilePicture, ChangeProfilePictureBuilder> {
  //getter fields

  XFile get image;

  ChangeProfilePicture._();

  factory ChangeProfilePicture(
          [Function(ChangeProfilePictureBuilder b) updates]) =
      _$ChangeProfilePicture;

  factory ChangeProfilePicture.initial() {
    return ChangeProfilePicture((b) => b);
  }
}

/// Logout
abstract class Logout extends ProfileEvent
    implements Built<Logout, LogoutBuilder> {
  //getter fields

  Logout._();

  factory Logout([Function(LogoutBuilder b) updates]) = _$Logout;

  factory Logout.initial() {
    return Logout((b) => b);
  }
}

/// GetProfile
abstract class GetProfile extends ProfileEvent
    implements Built<GetProfile, GetProfileBuilder> {
  //getter fields

  GetProfile._();

  factory GetProfile([Function(GetProfileBuilder b) updates]) = _$GetProfile;

  factory GetProfile.initial() {
    return GetProfile((b) => b);
  }
}

/// GetChefBalance
abstract class GetChefBalance extends ProfileEvent
    implements Built<GetChefBalance, GetChefBalanceBuilder> {
  //getter fields

  String? get startDate;

  String? get endDate;

  GetChefBalance._();

  factory GetChefBalance([Function(GetChefBalanceBuilder b) updates]) =
      _$GetChefBalance;

  factory GetChefBalance.initial() {
    return GetChefBalance((b) => b);
  }
}

/// GetOrdersHistory
abstract class GetOrdersHistory extends ProfileEvent
    implements Built<GetOrdersHistory, GetOrdersHistoryBuilder> {
  //getter fields

  int get page;

  GetOrdersHistory._();

  factory GetOrdersHistory([Function(GetOrdersHistoryBuilder b) updates]) =
      _$GetOrdersHistory;

  factory GetOrdersHistory.initial() {
    return GetOrdersHistory((b) => b);
  }
}

/// GetOrdersMealsNote
abstract class GetOrdersMealsNote extends ProfileEvent
    implements Built<GetOrdersMealsNote, GetOrdersMealsNoteBuilder> {
  //getter fields

  GetOrdersMealsNote._();

  factory GetOrdersMealsNote([Function(GetOrdersMealsNoteBuilder b) updates]) =
      _$GetOrdersMealsNote;

  factory GetOrdersMealsNote.initial() {
    return GetOrdersMealsNote((b) => b);
  }
}

/// EditDeliverMealTime
abstract class EditDeliverMealTime extends ProfileEvent
    implements Built<EditDeliverMealTime, EditDeliverMealTimeBuilder> {
  //getter fields

  String get deliveryStartsAt;

  String get deliveryEndsAt;

  EditDeliverMealTime._();

  factory EditDeliverMealTime(
      [Function(EditDeliverMealTimeBuilder b) updates]) = _$EditDeliverMealTime;

  factory EditDeliverMealTime.initial() {
    return EditDeliverMealTime((b) => b);
  }
}

abstract class EditMaxMealsPerDay extends ProfileEvent
    implements Built<EditMaxMealsPerDay, EditMaxMealsPerDayBuilder> {
  //getter fields

  int get maxMealsPerDay;

  EditMaxMealsPerDay._();

  factory EditMaxMealsPerDay([Function(EditMaxMealsPerDayBuilder b) updates]) =
      _$EditMaxMealsPerDay;

  factory EditMaxMealsPerDay.initial() {
    return EditMaxMealsPerDay((b) => b);
  }
}

abstract class PickImage extends ProfileEvent
    implements Built<PickImage, PickImageBuilder> {
  //getter fields

  PickImage._();

  factory PickImage([Function(PickImageBuilder b) updates]) = _$PickImage;

  factory PickImage.initial() {
    return PickImage((b) => b);
  }
}

abstract class ClearMessage extends ProfileEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
      _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}
