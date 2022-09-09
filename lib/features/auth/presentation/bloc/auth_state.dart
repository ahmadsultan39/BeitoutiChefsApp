import 'package:built_value/built_value.dart';
import 'package:file_picker/file_picker.dart';
import 'package:location/location.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/user.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;

  bool get isCodeSent;

  bool get isCodeValid;

  bool get isRegisterRequestSent;

  LocationData? get locationData;

  User? get user;

  FilePickerResult? get filePickerResult;

  FilePickerResult? get profilePictureFile;

  AccessibilityStaysType? get accessibilityStaysType;

  AuthState._();

  factory AuthState([Function(AuthStateBuilder b) updates]) = _$AuthState;

  factory AuthState.initial() {
    return AuthState(
      (b) => b
        ..isLoading = false
        ..user = null
        ..locationData = null
        ..isRegisterRequestSent = false
        ..accessibilityStaysType = null
        ..isCodeSent = false
        ..filePickerResult = null
        ..profilePictureFile = null
        ..isCodeValid = false
        ..message = ""
        ..error = false,
    );
  }
}
