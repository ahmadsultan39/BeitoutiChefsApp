import 'package:built_value/built_value.dart';

import '../../domain/entities/request_register.dart';

part 'auth_event.g.dart';

abstract class AuthEvent {}

abstract class CheckCode extends AuthEvent
    implements Built<CheckCode, CheckCodeBuilder> {
  //getter fields

  String get phoneNumber;

  String get code;

  CheckCode._();

  factory CheckCode([Function(CheckCodeBuilder b) updates]) = _$CheckCode;

  factory CheckCode.initial() {
    return CheckCode((b) => b);
  }
}

abstract class RequestRegister extends AuthEvent
    implements Built<RequestRegister, RequestRegisterBuilder> {
  //getter fields

  RegisterRequest get request;

  RequestRegister._();

  factory RequestRegister([Function(RequestRegisterBuilder b) updates]) =
      _$RequestRegister;

  factory RequestRegister.initial() {
    return RequestRegister((b) => b);
  }
}

abstract class ReInitializeState extends AuthEvent
    implements Built<ReInitializeState, ReInitializeStateBuilder> {
  //getter fields

  ReInitializeState._();

  factory ReInitializeState([Function(ReInitializeStateBuilder b) updates]) =
      _$ReInitializeState;

  factory ReInitializeState.initial() {
    return ReInitializeState((b) => b);
  }
}

abstract class GetCurrentLocation extends AuthEvent
    implements Built<GetCurrentLocation, GetCurrentLocationBuilder> {
  //getter fields

  GetCurrentLocation._();

  factory GetCurrentLocation([Function(GetCurrentLocationBuilder b) updates]) =
      _$GetCurrentLocation;

  factory GetCurrentLocation.initial() {
    return GetCurrentLocation((b) => b);
  }
}

abstract class PickProfilePicture extends AuthEvent
    implements Built<PickProfilePicture, PickProfilePictureBuilder> {
  //getter fields

  PickProfilePicture._();

  factory PickProfilePicture([Function(PickProfilePictureBuilder b) updates]) =
      _$PickProfilePicture;

  factory PickProfilePicture.initial() {
    return PickProfilePicture((b) => b);
  }
}

abstract class PickFile extends AuthEvent
    implements Built<PickFile, PickFileBuilder> {
  //getter fields

  PickFile._();

  factory PickFile([Function(PickFileBuilder b) updates]) =
  _$PickFile;

  factory PickFile.initial() {
    return PickFile((b) => b);
  }
}

abstract class ClearMessage extends AuthEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
      _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}

abstract class SendCode extends AuthEvent
    implements Built<SendCode, SendCodeBuilder> {
  //getter fields

  String get phoneNumber;

  SendCode._();

  factory SendCode([Function(SendCodeBuilder b) updates]) = _$SendCode;

  factory SendCode.initial() {
    return SendCode((b) => b);
  }
}
