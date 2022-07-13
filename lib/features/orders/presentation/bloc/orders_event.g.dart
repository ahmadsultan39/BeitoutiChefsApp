// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetOrdersTimesEvent extends GetOrdersTimesEvent {
  factory _$GetOrdersTimesEvent(
          [void Function(GetOrdersTimesEventBuilder)? updates]) =>
      (new GetOrdersTimesEventBuilder()..update(updates))._build();

  _$GetOrdersTimesEvent._() : super._();

  @override
  GetOrdersTimesEvent rebuild(
          void Function(GetOrdersTimesEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrdersTimesEventBuilder toBuilder() =>
      new GetOrdersTimesEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrdersTimesEvent;
  }

  @override
  int get hashCode {
    return 174213308;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetOrdersTimesEvent').toString();
  }
}

class GetOrdersTimesEventBuilder
    implements Builder<GetOrdersTimesEvent, GetOrdersTimesEventBuilder> {
  _$GetOrdersTimesEvent? _$v;

  GetOrdersTimesEventBuilder();

  @override
  void replace(GetOrdersTimesEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrdersTimesEvent;
  }

  @override
  void update(void Function(GetOrdersTimesEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrdersTimesEvent build() => _build();

  _$GetOrdersTimesEvent _build() {
    final _$result = _$v ?? new _$GetOrdersTimesEvent._();
    replace(_$result);
    return _$result;
  }
}

class _$GetTimeOrdersEvent extends GetTimeOrdersEvent {
  @override
  final String time;

  factory _$GetTimeOrdersEvent(
          [void Function(GetTimeOrdersEventBuilder)? updates]) =>
      (new GetTimeOrdersEventBuilder()..update(updates))._build();

  _$GetTimeOrdersEvent._({required this.time}) : super._() {
    BuiltValueNullFieldError.checkNotNull(time, r'GetTimeOrdersEvent', 'time');
  }

  @override
  GetTimeOrdersEvent rebuild(
          void Function(GetTimeOrdersEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetTimeOrdersEventBuilder toBuilder() =>
      new GetTimeOrdersEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetTimeOrdersEvent && time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc(0, time.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetTimeOrdersEvent')
          ..add('time', time))
        .toString();
  }
}

class GetTimeOrdersEventBuilder
    implements Builder<GetTimeOrdersEvent, GetTimeOrdersEventBuilder> {
  _$GetTimeOrdersEvent? _$v;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  GetTimeOrdersEventBuilder();

  GetTimeOrdersEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetTimeOrdersEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetTimeOrdersEvent;
  }

  @override
  void update(void Function(GetTimeOrdersEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetTimeOrdersEvent build() => _build();

  _$GetTimeOrdersEvent _build() {
    final _$result = _$v ??
        new _$GetTimeOrdersEvent._(
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'GetTimeOrdersEvent', 'time'));
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
