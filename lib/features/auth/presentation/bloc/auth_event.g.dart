// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckCode extends CheckCode {
  @override
  final String phoneNumber;
  @override
  final String code;

  factory _$CheckCode([void Function(CheckCodeBuilder)? updates]) =>
      (new CheckCodeBuilder()..update(updates))._build();

  _$CheckCode._({required this.phoneNumber, required this.code}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'CheckCode', 'phoneNumber');
    BuiltValueNullFieldError.checkNotNull(code, r'CheckCode', 'code');
  }

  @override
  CheckCode rebuild(void Function(CheckCodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckCodeBuilder toBuilder() => new CheckCodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckCode &&
        phoneNumber == other.phoneNumber &&
        code == other.code;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, phoneNumber.hashCode), code.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckCode')
          ..add('phoneNumber', phoneNumber)
          ..add('code', code))
        .toString();
  }
}

class CheckCodeBuilder implements Builder<CheckCode, CheckCodeBuilder> {
  _$CheckCode? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  CheckCodeBuilder();

  CheckCodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckCode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheckCode;
  }

  @override
  void update(void Function(CheckCodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckCode build() => _build();

  _$CheckCode _build() {
    final _$result = _$v ??
        new _$CheckCode._(
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'CheckCode', 'phoneNumber'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'CheckCode', 'code'));
    replace(_$result);
    return _$result;
  }
}

class _$RequestRegister extends RequestRegister {
  @override
  final RegisterRequest request;

  factory _$RequestRegister([void Function(RequestRegisterBuilder)? updates]) =>
      (new RequestRegisterBuilder()..update(updates))._build();

  _$RequestRegister._({required this.request}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        request, r'RequestRegister', 'request');
  }

  @override
  RequestRegister rebuild(void Function(RequestRegisterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestRegisterBuilder toBuilder() =>
      new RequestRegisterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestRegister && request == other.request;
  }

  @override
  int get hashCode {
    return $jf($jc(0, request.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RequestRegister')
          ..add('request', request))
        .toString();
  }
}

class RequestRegisterBuilder
    implements Builder<RequestRegister, RequestRegisterBuilder> {
  _$RequestRegister? _$v;

  RegisterRequest? _request;
  RegisterRequest? get request => _$this._request;
  set request(RegisterRequest? request) => _$this._request = request;

  RequestRegisterBuilder();

  RequestRegisterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _request = $v.request;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestRegister other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RequestRegister;
  }

  @override
  void update(void Function(RequestRegisterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RequestRegister build() => _build();

  _$RequestRegister _build() {
    final _$result = _$v ??
        new _$RequestRegister._(
            request: BuiltValueNullFieldError.checkNotNull(
                request, r'RequestRegister', 'request'));
    replace(_$result);
    return _$result;
  }
}

class _$ReInitializeState extends ReInitializeState {
  factory _$ReInitializeState(
          [void Function(ReInitializeStateBuilder)? updates]) =>
      (new ReInitializeStateBuilder()..update(updates))._build();

  _$ReInitializeState._() : super._();

  @override
  ReInitializeState rebuild(void Function(ReInitializeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReInitializeStateBuilder toBuilder() =>
      new ReInitializeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReInitializeState;
  }

  @override
  int get hashCode {
    return 433292000;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ReInitializeState').toString();
  }
}

class ReInitializeStateBuilder
    implements Builder<ReInitializeState, ReInitializeStateBuilder> {
  _$ReInitializeState? _$v;

  ReInitializeStateBuilder();

  @override
  void replace(ReInitializeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReInitializeState;
  }

  @override
  void update(void Function(ReInitializeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReInitializeState build() => _build();

  _$ReInitializeState _build() {
    final _$result = _$v ?? new _$ReInitializeState._();
    replace(_$result);
    return _$result;
  }
}

class _$GetCurrentLocation extends GetCurrentLocation {
  factory _$GetCurrentLocation(
          [void Function(GetCurrentLocationBuilder)? updates]) =>
      (new GetCurrentLocationBuilder()..update(updates))._build();

  _$GetCurrentLocation._() : super._();

  @override
  GetCurrentLocation rebuild(
          void Function(GetCurrentLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCurrentLocationBuilder toBuilder() =>
      new GetCurrentLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCurrentLocation;
  }

  @override
  int get hashCode {
    return 214810858;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetCurrentLocation').toString();
  }
}

class GetCurrentLocationBuilder
    implements Builder<GetCurrentLocation, GetCurrentLocationBuilder> {
  _$GetCurrentLocation? _$v;

  GetCurrentLocationBuilder();

  @override
  void replace(GetCurrentLocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCurrentLocation;
  }

  @override
  void update(void Function(GetCurrentLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCurrentLocation build() => _build();

  _$GetCurrentLocation _build() {
    final _$result = _$v ?? new _$GetCurrentLocation._();
    replace(_$result);
    return _$result;
  }
}

class _$PickProfilePicture extends PickProfilePicture {
  factory _$PickProfilePicture(
          [void Function(PickProfilePictureBuilder)? updates]) =>
      (new PickProfilePictureBuilder()..update(updates))._build();

  _$PickProfilePicture._() : super._();

  @override
  PickProfilePicture rebuild(
          void Function(PickProfilePictureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PickProfilePictureBuilder toBuilder() =>
      new PickProfilePictureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PickProfilePicture;
  }

  @override
  int get hashCode {
    return 660512035;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'PickProfilePicture').toString();
  }
}

class PickProfilePictureBuilder
    implements Builder<PickProfilePicture, PickProfilePictureBuilder> {
  _$PickProfilePicture? _$v;

  PickProfilePictureBuilder();

  @override
  void replace(PickProfilePicture other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PickProfilePicture;
  }

  @override
  void update(void Function(PickProfilePictureBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PickProfilePicture build() => _build();

  _$PickProfilePicture _build() {
    final _$result = _$v ?? new _$PickProfilePicture._();
    replace(_$result);
    return _$result;
  }
}

class _$PickFile extends PickFile {
  factory _$PickFile([void Function(PickFileBuilder)? updates]) =>
      (new PickFileBuilder()..update(updates))._build();

  _$PickFile._() : super._();

  @override
  PickFile rebuild(void Function(PickFileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PickFileBuilder toBuilder() => new PickFileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PickFile;
  }

  @override
  int get hashCode {
    return 716081539;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'PickFile').toString();
  }
}

class PickFileBuilder implements Builder<PickFile, PickFileBuilder> {
  _$PickFile? _$v;

  PickFileBuilder();

  @override
  void replace(PickFile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PickFile;
  }

  @override
  void update(void Function(PickFileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PickFile build() => _build();

  _$PickFile _build() {
    final _$result = _$v ?? new _$PickFile._();
    replace(_$result);
    return _$result;
  }
}

class _$ClearMessage extends ClearMessage {
  factory _$ClearMessage([void Function(ClearMessageBuilder)? updates]) =>
      (new ClearMessageBuilder()..update(updates))._build();

  _$ClearMessage._() : super._();

  @override
  ClearMessage rebuild(void Function(ClearMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearMessageBuilder toBuilder() => new ClearMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearMessage;
  }

  @override
  int get hashCode {
    return 147402354;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearMessage').toString();
  }
}

class ClearMessageBuilder
    implements Builder<ClearMessage, ClearMessageBuilder> {
  _$ClearMessage? _$v;

  ClearMessageBuilder();

  @override
  void replace(ClearMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearMessage;
  }

  @override
  void update(void Function(ClearMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearMessage build() => _build();

  _$ClearMessage _build() {
    final _$result = _$v ?? new _$ClearMessage._();
    replace(_$result);
    return _$result;
  }
}

class _$SendCode extends SendCode {
  @override
  final String phoneNumber;

  factory _$SendCode([void Function(SendCodeBuilder)? updates]) =>
      (new SendCodeBuilder()..update(updates))._build();

  _$SendCode._({required this.phoneNumber}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'SendCode', 'phoneNumber');
  }

  @override
  SendCode rebuild(void Function(SendCodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendCodeBuilder toBuilder() => new SendCodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendCode && phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(0, phoneNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendCode')
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class SendCodeBuilder implements Builder<SendCode, SendCodeBuilder> {
  _$SendCode? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  SendCodeBuilder();

  SendCodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendCode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendCode;
  }

  @override
  void update(void Function(SendCodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendCode build() => _build();

  _$SendCode _build() {
    final _$result = _$v ??
        new _$SendCode._(
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'SendCode', 'phoneNumber'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
