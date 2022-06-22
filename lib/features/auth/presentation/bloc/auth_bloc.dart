import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import '../../domain/entities/request_register.dart';
import '../../domain/use_cases/check_code_use_case.dart';
import '../../domain/use_cases/request_register_use_case.dart';
import '../../domain/use_cases/send_code_use_case.dart';
import 'auth.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckCodeUseCase _checkCodeUseCase;
  final RequestRegisterUseCase _requestRegisterUseCase;
  final SendCodeUseCase _sendCodeUseCase;
  final FilePicker _filePicker;
  final Location _location;

  void addCheckCodeEvent({
    required String phoneNumber,
    required String code,
  }) {
    add(CheckCode(
      (b) => b
        ..phoneNumber = phoneNumber
        ..code = code,
    ));
  }

  void addSendCodeEvent({
    required String phoneNumber,
  }) {
    add(SendCode(
      (b) => b..phoneNumber = phoneNumber,
    ));
  }

  void addRequestRegisterEvent({required RegisterRequest request}) {
    add(RequestRegister(
      (b) => b..request = request,
    ));
  }

  void addPickFileEvent() {
    add(PickFile());
  }

  void addGetCurrentLocationEvent() {
    add(GetCurrentLocation());
  }

  void clearMessage() {
    add(ClearMessage());
  }

  void reInitializeState() {
    add(ReInitializeState());
  }

  @factoryMethod
  AuthBloc(
    this._checkCodeUseCase,
    this._requestRegisterUseCase,
    this._sendCodeUseCase,
    this._location,
    this._filePicker,
  ) : super(AuthState.initial()) {
    on<AuthEvent>(
      (event, emit) async {
        /// *** SendCode *** //
        if (event is SendCode) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _sendCodeUseCase(
            ParamsSendCodeUseCase(
              phoneNumber: event.phoneNumber,
            ),
          );

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error,
              ),
            ),
            (success) => emit(state.rebuild(
              (b) => b
                ..isLoading = false
                ..isCodeSent = true,
            )),
          );
        }

        /// *** CheckCode *** //
        if (event is CheckCode) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _checkCodeUseCase(
            ParamsCheckCodeUseCase(
              phoneNumber: event.phoneNumber,
              code: event.code,
            ),
          );

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error,
              ),
            ),
            (accessibilityStatus) => emit(state.rebuild(
              (b) => b
                ..isLoading = false
                ..isCodeValid = true
                ..accessibilityStaysType = accessibilityStatus.status
                ..user = accessibilityStatus.user,
            )),
          );
        }

        /// *** RequestRegister *** //
        if (event is RequestRegister) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _requestRegisterUseCase(
            ParamsRequestRegisterUseCase(request: event.request),
          );

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error,
              ),
            ),
            (success) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..isRegisterRequestSent = true,
              ),
            ),
          );
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

        /// *** ReInitializeState *** //
        if (event is ReInitializeState) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..user = null
                ..isRegisterRequestSent = false
                ..accessibilityStaysType = null
                ..isCodeSent = false
                ..isCodeValid = false
                ..message = ""
                ..error = false,
            ),
          );
        }

        if (event is GetCurrentLocation) {
          bool _serviceEnabled;
          PermissionStatus _permissionGranted;
          LocationData _locationData;

          _serviceEnabled = await _location.serviceEnabled();
          if (!_serviceEnabled) {
            _serviceEnabled = await _location.requestService();
            if (!_serviceEnabled) {
              return;
            }
          }

          _permissionGranted = await _location.hasPermission();
          if (_permissionGranted == PermissionStatus.denied) {
            _permissionGranted = await _location.requestPermission();
            if (_permissionGranted != PermissionStatus.granted) {
              return;
            }
          }

          _locationData = await _location.getLocation();

          emit(
            state.rebuild(
              (b) => b..locationData = _locationData,
            ),
          );
        }
        if (event is PickFile) {
          final file = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf','docx'], //here
          );
          if (file != null) {
            emit(
              state.rebuild(
                (b) => b..filePickerResult = file,
              ),
            );
          }
        }
      },
    );
  }
}
