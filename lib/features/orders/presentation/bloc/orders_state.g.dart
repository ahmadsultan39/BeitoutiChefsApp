// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrdersState extends OrdersState {
  @override
  final bool isLoading;
  @override
  final String message;
  @override
  final bool error;
  @override
  final BuiltList<OrdersTimes> todayTimes;
  @override
  final BuiltList<OrdersTimes> tomorrowTimes;
  @override
  final BuiltList<TimeOrder> todayOrders;
  @override
  final BuiltList<TimeOrder> tomorrowOrders;
  @override
  final bool isTodayOrdersTimesLoading;
  @override
  final bool isTomorrowOrdersTimesLoading;
  @override
  final bool isTodayTimeOrdersLoading;
  @override
  final bool isTomorrowTimeOrdersLoading;

  factory _$OrdersState([void Function(OrdersStateBuilder)? updates]) =>
      (new OrdersStateBuilder()..update(updates))._build();

  _$OrdersState._(
      {required this.isLoading,
      required this.message,
      required this.error,
      required this.todayTimes,
      required this.tomorrowTimes,
      required this.todayOrders,
      required this.tomorrowOrders,
      required this.isTodayOrdersTimesLoading,
      required this.isTomorrowOrdersTimesLoading,
      required this.isTodayTimeOrdersLoading,
      required this.isTomorrowTimeOrdersLoading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'OrdersState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(message, r'OrdersState', 'message');
    BuiltValueNullFieldError.checkNotNull(error, r'OrdersState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        todayTimes, r'OrdersState', 'todayTimes');
    BuiltValueNullFieldError.checkNotNull(
        tomorrowTimes, r'OrdersState', 'tomorrowTimes');
    BuiltValueNullFieldError.checkNotNull(
        todayOrders, r'OrdersState', 'todayOrders');
    BuiltValueNullFieldError.checkNotNull(
        tomorrowOrders, r'OrdersState', 'tomorrowOrders');
    BuiltValueNullFieldError.checkNotNull(
        isTodayOrdersTimesLoading, r'OrdersState', 'isTodayOrdersTimesLoading');
    BuiltValueNullFieldError.checkNotNull(isTomorrowOrdersTimesLoading,
        r'OrdersState', 'isTomorrowOrdersTimesLoading');
    BuiltValueNullFieldError.checkNotNull(
        isTodayTimeOrdersLoading, r'OrdersState', 'isTodayTimeOrdersLoading');
    BuiltValueNullFieldError.checkNotNull(isTomorrowTimeOrdersLoading,
        r'OrdersState', 'isTomorrowTimeOrdersLoading');
  }

  @override
  OrdersState rebuild(void Function(OrdersStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersStateBuilder toBuilder() => new OrdersStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrdersState &&
        isLoading == other.isLoading &&
        message == other.message &&
        error == other.error &&
        todayTimes == other.todayTimes &&
        tomorrowTimes == other.tomorrowTimes &&
        todayOrders == other.todayOrders &&
        tomorrowOrders == other.tomorrowOrders &&
        isTodayOrdersTimesLoading == other.isTodayOrdersTimesLoading &&
        isTomorrowOrdersTimesLoading == other.isTomorrowOrdersTimesLoading &&
        isTodayTimeOrdersLoading == other.isTodayTimeOrdersLoading &&
        isTomorrowTimeOrdersLoading == other.isTomorrowTimeOrdersLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, isLoading.hashCode),
                                            message.hashCode),
                                        error.hashCode),
                                    todayTimes.hashCode),
                                tomorrowTimes.hashCode),
                            todayOrders.hashCode),
                        tomorrowOrders.hashCode),
                    isTodayOrdersTimesLoading.hashCode),
                isTomorrowOrdersTimesLoading.hashCode),
            isTodayTimeOrdersLoading.hashCode),
        isTomorrowTimeOrdersLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrdersState')
          ..add('isLoading', isLoading)
          ..add('message', message)
          ..add('error', error)
          ..add('todayTimes', todayTimes)
          ..add('tomorrowTimes', tomorrowTimes)
          ..add('todayOrders', todayOrders)
          ..add('tomorrowOrders', tomorrowOrders)
          ..add('isTodayOrdersTimesLoading', isTodayOrdersTimesLoading)
          ..add('isTomorrowOrdersTimesLoading', isTomorrowOrdersTimesLoading)
          ..add('isTodayTimeOrdersLoading', isTodayTimeOrdersLoading)
          ..add('isTomorrowTimeOrdersLoading', isTomorrowTimeOrdersLoading))
        .toString();
  }
}

class OrdersStateBuilder implements Builder<OrdersState, OrdersStateBuilder> {
  _$OrdersState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  ListBuilder<OrdersTimes>? _todayTimes;
  ListBuilder<OrdersTimes> get todayTimes =>
      _$this._todayTimes ??= new ListBuilder<OrdersTimes>();
  set todayTimes(ListBuilder<OrdersTimes>? todayTimes) =>
      _$this._todayTimes = todayTimes;

  ListBuilder<OrdersTimes>? _tomorrowTimes;
  ListBuilder<OrdersTimes> get tomorrowTimes =>
      _$this._tomorrowTimes ??= new ListBuilder<OrdersTimes>();
  set tomorrowTimes(ListBuilder<OrdersTimes>? tomorrowTimes) =>
      _$this._tomorrowTimes = tomorrowTimes;

  ListBuilder<TimeOrder>? _todayOrders;
  ListBuilder<TimeOrder> get todayOrders =>
      _$this._todayOrders ??= new ListBuilder<TimeOrder>();
  set todayOrders(ListBuilder<TimeOrder>? todayOrders) =>
      _$this._todayOrders = todayOrders;

  ListBuilder<TimeOrder>? _tomorrowOrders;
  ListBuilder<TimeOrder> get tomorrowOrders =>
      _$this._tomorrowOrders ??= new ListBuilder<TimeOrder>();
  set tomorrowOrders(ListBuilder<TimeOrder>? tomorrowOrders) =>
      _$this._tomorrowOrders = tomorrowOrders;

  bool? _isTodayOrdersTimesLoading;
  bool? get isTodayOrdersTimesLoading => _$this._isTodayOrdersTimesLoading;
  set isTodayOrdersTimesLoading(bool? isTodayOrdersTimesLoading) =>
      _$this._isTodayOrdersTimesLoading = isTodayOrdersTimesLoading;

  bool? _isTomorrowOrdersTimesLoading;
  bool? get isTomorrowOrdersTimesLoading =>
      _$this._isTomorrowOrdersTimesLoading;
  set isTomorrowOrdersTimesLoading(bool? isTomorrowOrdersTimesLoading) =>
      _$this._isTomorrowOrdersTimesLoading = isTomorrowOrdersTimesLoading;

  bool? _isTodayTimeOrdersLoading;
  bool? get isTodayTimeOrdersLoading => _$this._isTodayTimeOrdersLoading;
  set isTodayTimeOrdersLoading(bool? isTodayTimeOrdersLoading) =>
      _$this._isTodayTimeOrdersLoading = isTodayTimeOrdersLoading;

  bool? _isTomorrowTimeOrdersLoading;
  bool? get isTomorrowTimeOrdersLoading => _$this._isTomorrowTimeOrdersLoading;
  set isTomorrowTimeOrdersLoading(bool? isTomorrowTimeOrdersLoading) =>
      _$this._isTomorrowTimeOrdersLoading = isTomorrowTimeOrdersLoading;

  OrdersStateBuilder();

  OrdersStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _message = $v.message;
      _error = $v.error;
      _todayTimes = $v.todayTimes.toBuilder();
      _tomorrowTimes = $v.tomorrowTimes.toBuilder();
      _todayOrders = $v.todayOrders.toBuilder();
      _tomorrowOrders = $v.tomorrowOrders.toBuilder();
      _isTodayOrdersTimesLoading = $v.isTodayOrdersTimesLoading;
      _isTomorrowOrdersTimesLoading = $v.isTomorrowOrdersTimesLoading;
      _isTodayTimeOrdersLoading = $v.isTodayTimeOrdersLoading;
      _isTomorrowTimeOrdersLoading = $v.isTomorrowTimeOrdersLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrdersState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrdersState;
  }

  @override
  void update(void Function(OrdersStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrdersState build() => _build();

  _$OrdersState _build() {
    _$OrdersState _$result;
    try {
      _$result = _$v ??
          new _$OrdersState._(
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'OrdersState', 'isLoading'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'OrdersState', 'message'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'OrdersState', 'error'),
              todayTimes: todayTimes.build(),
              tomorrowTimes: tomorrowTimes.build(),
              todayOrders: todayOrders.build(),
              tomorrowOrders: tomorrowOrders.build(),
              isTodayOrdersTimesLoading: BuiltValueNullFieldError.checkNotNull(
                  isTodayOrdersTimesLoading, r'OrdersState', 'isTodayOrdersTimesLoading'),
              isTomorrowOrdersTimesLoading: BuiltValueNullFieldError.checkNotNull(
                  isTomorrowOrdersTimesLoading,
                  r'OrdersState',
                  'isTomorrowOrdersTimesLoading'),
              isTodayTimeOrdersLoading: BuiltValueNullFieldError.checkNotNull(
                  isTodayTimeOrdersLoading, r'OrdersState', 'isTodayTimeOrdersLoading'),
              isTomorrowTimeOrdersLoading: BuiltValueNullFieldError.checkNotNull(
                  isTomorrowTimeOrdersLoading,
                  r'OrdersState',
                  'isTomorrowTimeOrdersLoading'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'todayTimes';
        todayTimes.build();
        _$failedField = 'tomorrowTimes';
        tomorrowTimes.build();
        _$failedField = 'todayOrders';
        todayOrders.build();
        _$failedField = 'tomorrowOrders';
        tomorrowOrders.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrdersState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
