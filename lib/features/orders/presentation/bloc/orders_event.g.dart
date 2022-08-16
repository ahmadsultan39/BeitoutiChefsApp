// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetTomorrowOrdersTimes extends GetTomorrowOrdersTimes {
  factory _$GetTomorrowOrdersTimes(
          [void Function(GetTomorrowOrdersTimesBuilder)? updates]) =>
      (new GetTomorrowOrdersTimesBuilder()..update(updates))._build();

  _$GetTomorrowOrdersTimes._() : super._();

  @override
  GetTomorrowOrdersTimes rebuild(
          void Function(GetTomorrowOrdersTimesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetTomorrowOrdersTimesBuilder toBuilder() =>
      new GetTomorrowOrdersTimesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetTomorrowOrdersTimes;
  }

  @override
  int get hashCode {
    return 158102221;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetTomorrowOrdersTimes').toString();
  }
}

class GetTomorrowOrdersTimesBuilder
    implements Builder<GetTomorrowOrdersTimes, GetTomorrowOrdersTimesBuilder> {
  _$GetTomorrowOrdersTimes? _$v;

  GetTomorrowOrdersTimesBuilder();

  @override
  void replace(GetTomorrowOrdersTimes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetTomorrowOrdersTimes;
  }

  @override
  void update(void Function(GetTomorrowOrdersTimesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetTomorrowOrdersTimes build() => _build();

  _$GetTomorrowOrdersTimes _build() {
    final _$result = _$v ?? new _$GetTomorrowOrdersTimes._();
    replace(_$result);
    return _$result;
  }
}

class _$GetTodayOrdersTimes extends GetTodayOrdersTimes {
  factory _$GetTodayOrdersTimes(
          [void Function(GetTodayOrdersTimesBuilder)? updates]) =>
      (new GetTodayOrdersTimesBuilder()..update(updates))._build();

  _$GetTodayOrdersTimes._() : super._();

  @override
  GetTodayOrdersTimes rebuild(
          void Function(GetTodayOrdersTimesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetTodayOrdersTimesBuilder toBuilder() =>
      new GetTodayOrdersTimesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetTodayOrdersTimes;
  }

  @override
  int get hashCode {
    return 448180700;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetTodayOrdersTimes').toString();
  }
}

class GetTodayOrdersTimesBuilder
    implements Builder<GetTodayOrdersTimes, GetTodayOrdersTimesBuilder> {
  _$GetTodayOrdersTimes? _$v;

  GetTodayOrdersTimesBuilder();

  @override
  void replace(GetTodayOrdersTimes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetTodayOrdersTimes;
  }

  @override
  void update(void Function(GetTodayOrdersTimesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetTodayOrdersTimes build() => _build();

  _$GetTodayOrdersTimes _build() {
    final _$result = _$v ?? new _$GetTodayOrdersTimes._();
    replace(_$result);
    return _$result;
  }
}

class _$GetTodayTimeOrdersEvent extends GetTodayTimeOrdersEvent {
  @override
  final String time;

  factory _$GetTodayTimeOrdersEvent(
          [void Function(GetTodayTimeOrdersEventBuilder)? updates]) =>
      (new GetTodayTimeOrdersEventBuilder()..update(updates))._build();

  _$GetTodayTimeOrdersEvent._({required this.time}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        time, r'GetTodayTimeOrdersEvent', 'time');
  }

  @override
  GetTodayTimeOrdersEvent rebuild(
          void Function(GetTodayTimeOrdersEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetTodayTimeOrdersEventBuilder toBuilder() =>
      new GetTodayTimeOrdersEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetTodayTimeOrdersEvent && time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc(0, time.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetTodayTimeOrdersEvent')
          ..add('time', time))
        .toString();
  }
}

class GetTodayTimeOrdersEventBuilder
    implements
        Builder<GetTodayTimeOrdersEvent, GetTodayTimeOrdersEventBuilder> {
  _$GetTodayTimeOrdersEvent? _$v;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  GetTodayTimeOrdersEventBuilder();

  GetTodayTimeOrdersEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetTodayTimeOrdersEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetTodayTimeOrdersEvent;
  }

  @override
  void update(void Function(GetTodayTimeOrdersEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetTodayTimeOrdersEvent build() => _build();

  _$GetTodayTimeOrdersEvent _build() {
    final _$result = _$v ??
        new _$GetTodayTimeOrdersEvent._(
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'GetTodayTimeOrdersEvent', 'time'));
    replace(_$result);
    return _$result;
  }
}

class _$GetTomorrowTimeOrdersEvent extends GetTomorrowTimeOrdersEvent {
  @override
  final String time;

  factory _$GetTomorrowTimeOrdersEvent(
          [void Function(GetTomorrowTimeOrdersEventBuilder)? updates]) =>
      (new GetTomorrowTimeOrdersEventBuilder()..update(updates))._build();

  _$GetTomorrowTimeOrdersEvent._({required this.time}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        time, r'GetTomorrowTimeOrdersEvent', 'time');
  }

  @override
  GetTomorrowTimeOrdersEvent rebuild(
          void Function(GetTomorrowTimeOrdersEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetTomorrowTimeOrdersEventBuilder toBuilder() =>
      new GetTomorrowTimeOrdersEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetTomorrowTimeOrdersEvent && time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc(0, time.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetTomorrowTimeOrdersEvent')
          ..add('time', time))
        .toString();
  }
}

class GetTomorrowTimeOrdersEventBuilder
    implements
        Builder<GetTomorrowTimeOrdersEvent, GetTomorrowTimeOrdersEventBuilder> {
  _$GetTomorrowTimeOrdersEvent? _$v;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  GetTomorrowTimeOrdersEventBuilder();

  GetTomorrowTimeOrdersEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetTomorrowTimeOrdersEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetTomorrowTimeOrdersEvent;
  }

  @override
  void update(void Function(GetTomorrowTimeOrdersEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetTomorrowTimeOrdersEvent build() => _build();

  _$GetTomorrowTimeOrdersEvent _build() {
    final _$result = _$v ??
        new _$GetTomorrowTimeOrdersEvent._(
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'GetTomorrowTimeOrdersEvent', 'time'));
    replace(_$result);
    return _$result;
  }
}

class _$ChangeStatusEvent extends ChangeStatusEvent {
  @override
  final int orderId;
  @override
  final String time;

  factory _$ChangeStatusEvent(
          [void Function(ChangeStatusEventBuilder)? updates]) =>
      (new ChangeStatusEventBuilder()..update(updates))._build();

  _$ChangeStatusEvent._({required this.orderId, required this.time})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        orderId, r'ChangeStatusEvent', 'orderId');
    BuiltValueNullFieldError.checkNotNull(time, r'ChangeStatusEvent', 'time');
  }

  @override
  ChangeStatusEvent rebuild(void Function(ChangeStatusEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeStatusEventBuilder toBuilder() =>
      new ChangeStatusEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeStatusEvent &&
        orderId == other.orderId &&
        time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, orderId.hashCode), time.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeStatusEvent')
          ..add('orderId', orderId)
          ..add('time', time))
        .toString();
  }
}

class ChangeStatusEventBuilder
    implements Builder<ChangeStatusEvent, ChangeStatusEventBuilder> {
  _$ChangeStatusEvent? _$v;

  int? _orderId;
  int? get orderId => _$this._orderId;
  set orderId(int? orderId) => _$this._orderId = orderId;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  ChangeStatusEventBuilder();

  ChangeStatusEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderId = $v.orderId;
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeStatusEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeStatusEvent;
  }

  @override
  void update(void Function(ChangeStatusEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeStatusEvent build() => _build();

  _$ChangeStatusEvent _build() {
    final _$result = _$v ??
        new _$ChangeStatusEvent._(
            orderId: BuiltValueNullFieldError.checkNotNull(
                orderId, r'ChangeStatusEvent', 'orderId'),
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'ChangeStatusEvent', 'time'));
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
