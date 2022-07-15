// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeProfilePicture extends ChangeProfilePicture {
  @override
  final XFile image;

  factory _$ChangeProfilePicture(
          [void Function(ChangeProfilePictureBuilder)? updates]) =>
      (new ChangeProfilePictureBuilder()..update(updates))._build();

  _$ChangeProfilePicture._({required this.image}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        image, r'ChangeProfilePicture', 'image');
  }

  @override
  ChangeProfilePicture rebuild(
          void Function(ChangeProfilePictureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeProfilePictureBuilder toBuilder() =>
      new ChangeProfilePictureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeProfilePicture && image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(0, image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeProfilePicture')
          ..add('image', image))
        .toString();
  }
}

class ChangeProfilePictureBuilder
    implements Builder<ChangeProfilePicture, ChangeProfilePictureBuilder> {
  _$ChangeProfilePicture? _$v;

  XFile? _image;
  XFile? get image => _$this._image;
  set image(XFile? image) => _$this._image = image;

  ChangeProfilePictureBuilder();

  ChangeProfilePictureBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeProfilePicture other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeProfilePicture;
  }

  @override
  void update(void Function(ChangeProfilePictureBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeProfilePicture build() => _build();

  _$ChangeProfilePicture _build() {
    final _$result = _$v ??
        new _$ChangeProfilePicture._(
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'ChangeProfilePicture', 'image'));
    replace(_$result);
    return _$result;
  }
}

class _$Logout extends Logout {
  factory _$Logout([void Function(LogoutBuilder)? updates]) =>
      (new LogoutBuilder()..update(updates))._build();

  _$Logout._() : super._();

  @override
  Logout rebuild(void Function(LogoutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogoutBuilder toBuilder() => new LogoutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Logout;
  }

  @override
  int get hashCode {
    return 676553867;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'Logout').toString();
  }
}

class LogoutBuilder implements Builder<Logout, LogoutBuilder> {
  _$Logout? _$v;

  LogoutBuilder();

  @override
  void replace(Logout other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Logout;
  }

  @override
  void update(void Function(LogoutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Logout build() => _build();

  _$Logout _build() {
    final _$result = _$v ?? new _$Logout._();
    replace(_$result);
    return _$result;
  }
}

class _$GetProfile extends GetProfile {
  factory _$GetProfile([void Function(GetProfileBuilder)? updates]) =>
      (new GetProfileBuilder()..update(updates))._build();

  _$GetProfile._() : super._();

  @override
  GetProfile rebuild(void Function(GetProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetProfileBuilder toBuilder() => new GetProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetProfile;
  }

  @override
  int get hashCode {
    return 520564276;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetProfile').toString();
  }
}

class GetProfileBuilder implements Builder<GetProfile, GetProfileBuilder> {
  _$GetProfile? _$v;

  GetProfileBuilder();

  @override
  void replace(GetProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetProfile;
  }

  @override
  void update(void Function(GetProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetProfile build() => _build();

  _$GetProfile _build() {
    final _$result = _$v ?? new _$GetProfile._();
    replace(_$result);
    return _$result;
  }
}

class _$GetChefBalance extends GetChefBalance {
  @override
  final String? startDate;
  @override
  final String? endDate;

  factory _$GetChefBalance([void Function(GetChefBalanceBuilder)? updates]) =>
      (new GetChefBalanceBuilder()..update(updates))._build();

  _$GetChefBalance._({this.startDate, this.endDate}) : super._();

  @override
  GetChefBalance rebuild(void Function(GetChefBalanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetChefBalanceBuilder toBuilder() =>
      new GetChefBalanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetChefBalance &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, startDate.hashCode), endDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetChefBalance')
          ..add('startDate', startDate)
          ..add('endDate', endDate))
        .toString();
  }
}

class GetChefBalanceBuilder
    implements Builder<GetChefBalance, GetChefBalanceBuilder> {
  _$GetChefBalance? _$v;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _endDate;
  String? get endDate => _$this._endDate;
  set endDate(String? endDate) => _$this._endDate = endDate;

  GetChefBalanceBuilder();

  GetChefBalanceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetChefBalance other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetChefBalance;
  }

  @override
  void update(void Function(GetChefBalanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetChefBalance build() => _build();

  _$GetChefBalance _build() {
    final _$result =
        _$v ?? new _$GetChefBalance._(startDate: startDate, endDate: endDate);
    replace(_$result);
    return _$result;
  }
}

class _$GetOrdersHistory extends GetOrdersHistory {
  factory _$GetOrdersHistory(
          [void Function(GetOrdersHistoryBuilder)? updates]) =>
      (new GetOrdersHistoryBuilder()..update(updates))._build();

  _$GetOrdersHistory._() : super._();

  @override
  GetOrdersHistory rebuild(void Function(GetOrdersHistoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrdersHistoryBuilder toBuilder() =>
      new GetOrdersHistoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrdersHistory;
  }

  @override
  int get hashCode {
    return 711951771;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetOrdersHistory').toString();
  }
}

class GetOrdersHistoryBuilder
    implements Builder<GetOrdersHistory, GetOrdersHistoryBuilder> {
  _$GetOrdersHistory? _$v;

  GetOrdersHistoryBuilder();

  @override
  void replace(GetOrdersHistory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrdersHistory;
  }

  @override
  void update(void Function(GetOrdersHistoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrdersHistory build() => _build();

  _$GetOrdersHistory _build() {
    final _$result = _$v ?? new _$GetOrdersHistory._();
    replace(_$result);
    return _$result;
  }
}

class _$GetOrdersMealsNote extends GetOrdersMealsNote {
  factory _$GetOrdersMealsNote(
          [void Function(GetOrdersMealsNoteBuilder)? updates]) =>
      (new GetOrdersMealsNoteBuilder()..update(updates))._build();

  _$GetOrdersMealsNote._() : super._();

  @override
  GetOrdersMealsNote rebuild(
          void Function(GetOrdersMealsNoteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrdersMealsNoteBuilder toBuilder() =>
      new GetOrdersMealsNoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrdersMealsNote;
  }

  @override
  int get hashCode {
    return 1024942725;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetOrdersMealsNote').toString();
  }
}

class GetOrdersMealsNoteBuilder
    implements Builder<GetOrdersMealsNote, GetOrdersMealsNoteBuilder> {
  _$GetOrdersMealsNote? _$v;

  GetOrdersMealsNoteBuilder();

  @override
  void replace(GetOrdersMealsNote other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrdersMealsNote;
  }

  @override
  void update(void Function(GetOrdersMealsNoteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrdersMealsNote build() => _build();

  _$GetOrdersMealsNote _build() {
    final _$result = _$v ?? new _$GetOrdersMealsNote._();
    replace(_$result);
    return _$result;
  }
}

class _$EditDeliverMealTime extends EditDeliverMealTime {
  @override
  final String deliveryStartsAt;
  @override
  final String deliveryEndsAt;

  factory _$EditDeliverMealTime(
          [void Function(EditDeliverMealTimeBuilder)? updates]) =>
      (new EditDeliverMealTimeBuilder()..update(updates))._build();

  _$EditDeliverMealTime._(
      {required this.deliveryStartsAt, required this.deliveryEndsAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        deliveryStartsAt, r'EditDeliverMealTime', 'deliveryStartsAt');
    BuiltValueNullFieldError.checkNotNull(
        deliveryEndsAt, r'EditDeliverMealTime', 'deliveryEndsAt');
  }

  @override
  EditDeliverMealTime rebuild(
          void Function(EditDeliverMealTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditDeliverMealTimeBuilder toBuilder() =>
      new EditDeliverMealTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditDeliverMealTime &&
        deliveryStartsAt == other.deliveryStartsAt &&
        deliveryEndsAt == other.deliveryEndsAt;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deliveryStartsAt.hashCode), deliveryEndsAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditDeliverMealTime')
          ..add('deliveryStartsAt', deliveryStartsAt)
          ..add('deliveryEndsAt', deliveryEndsAt))
        .toString();
  }
}

class EditDeliverMealTimeBuilder
    implements Builder<EditDeliverMealTime, EditDeliverMealTimeBuilder> {
  _$EditDeliverMealTime? _$v;

  String? _deliveryStartsAt;
  String? get deliveryStartsAt => _$this._deliveryStartsAt;
  set deliveryStartsAt(String? deliveryStartsAt) =>
      _$this._deliveryStartsAt = deliveryStartsAt;

  String? _deliveryEndsAt;
  String? get deliveryEndsAt => _$this._deliveryEndsAt;
  set deliveryEndsAt(String? deliveryEndsAt) =>
      _$this._deliveryEndsAt = deliveryEndsAt;

  EditDeliverMealTimeBuilder();

  EditDeliverMealTimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deliveryStartsAt = $v.deliveryStartsAt;
      _deliveryEndsAt = $v.deliveryEndsAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditDeliverMealTime other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditDeliverMealTime;
  }

  @override
  void update(void Function(EditDeliverMealTimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditDeliverMealTime build() => _build();

  _$EditDeliverMealTime _build() {
    final _$result = _$v ??
        new _$EditDeliverMealTime._(
            deliveryStartsAt: BuiltValueNullFieldError.checkNotNull(
                deliveryStartsAt, r'EditDeliverMealTime', 'deliveryStartsAt'),
            deliveryEndsAt: BuiltValueNullFieldError.checkNotNull(
                deliveryEndsAt, r'EditDeliverMealTime', 'deliveryEndsAt'));
    replace(_$result);
    return _$result;
  }
}

class _$EditMaxMealsPerDay extends EditMaxMealsPerDay {
  @override
  final int maxMealsPerDay;

  factory _$EditMaxMealsPerDay(
          [void Function(EditMaxMealsPerDayBuilder)? updates]) =>
      (new EditMaxMealsPerDayBuilder()..update(updates))._build();

  _$EditMaxMealsPerDay._({required this.maxMealsPerDay}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        maxMealsPerDay, r'EditMaxMealsPerDay', 'maxMealsPerDay');
  }

  @override
  EditMaxMealsPerDay rebuild(
          void Function(EditMaxMealsPerDayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditMaxMealsPerDayBuilder toBuilder() =>
      new EditMaxMealsPerDayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditMaxMealsPerDay &&
        maxMealsPerDay == other.maxMealsPerDay;
  }

  @override
  int get hashCode {
    return $jf($jc(0, maxMealsPerDay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditMaxMealsPerDay')
          ..add('maxMealsPerDay', maxMealsPerDay))
        .toString();
  }
}

class EditMaxMealsPerDayBuilder
    implements Builder<EditMaxMealsPerDay, EditMaxMealsPerDayBuilder> {
  _$EditMaxMealsPerDay? _$v;

  int? _maxMealsPerDay;
  int? get maxMealsPerDay => _$this._maxMealsPerDay;
  set maxMealsPerDay(int? maxMealsPerDay) =>
      _$this._maxMealsPerDay = maxMealsPerDay;

  EditMaxMealsPerDayBuilder();

  EditMaxMealsPerDayBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _maxMealsPerDay = $v.maxMealsPerDay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditMaxMealsPerDay other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditMaxMealsPerDay;
  }

  @override
  void update(void Function(EditMaxMealsPerDayBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditMaxMealsPerDay build() => _build();

  _$EditMaxMealsPerDay _build() {
    final _$result = _$v ??
        new _$EditMaxMealsPerDay._(
            maxMealsPerDay: BuiltValueNullFieldError.checkNotNull(
                maxMealsPerDay, r'EditMaxMealsPerDay', 'maxMealsPerDay'));
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
