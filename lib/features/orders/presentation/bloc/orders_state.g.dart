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
  final List<OrdersTimes> times;
  @override
  final List<TimeOrder> orders;
  @override
  final bool isOrdersTimesLoading;
  @override
  final bool isTimeOrdersLoading;

  factory _$OrdersState([void Function(OrdersStateBuilder)? updates]) =>
      (new OrdersStateBuilder()..update(updates))._build();

  _$OrdersState._(
      {required this.isLoading,
      required this.message,
      required this.error,
      required this.times,
      required this.orders,
      required this.isOrdersTimesLoading,
      required this.isTimeOrdersLoading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'OrdersState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(message, r'OrdersState', 'message');
    BuiltValueNullFieldError.checkNotNull(error, r'OrdersState', 'error');
    BuiltValueNullFieldError.checkNotNull(times, r'OrdersState', 'times');
    BuiltValueNullFieldError.checkNotNull(orders, r'OrdersState', 'orders');
    BuiltValueNullFieldError.checkNotNull(
        isOrdersTimesLoading, r'OrdersState', 'isOrdersTimesLoading');
    BuiltValueNullFieldError.checkNotNull(
        isTimeOrdersLoading, r'OrdersState', 'isTimeOrdersLoading');
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
        times == other.times &&
        orders == other.orders &&
        isOrdersTimesLoading == other.isOrdersTimesLoading &&
        isTimeOrdersLoading == other.isTimeOrdersLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, isLoading.hashCode), message.hashCode),
                        error.hashCode),
                    times.hashCode),
                orders.hashCode),
            isOrdersTimesLoading.hashCode),
        isTimeOrdersLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrdersState')
          ..add('isLoading', isLoading)
          ..add('message', message)
          ..add('error', error)
          ..add('times', times)
          ..add('orders', orders)
          ..add('isOrdersTimesLoading', isOrdersTimesLoading)
          ..add('isTimeOrdersLoading', isTimeOrdersLoading))
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

  List<OrdersTimes>? _times;
  List<OrdersTimes>? get times => _$this._times;
  set times(List<OrdersTimes>? times) => _$this._times = times;

  List<TimeOrder>? _orders;
  List<TimeOrder>? get orders => _$this._orders;
  set orders(List<TimeOrder>? orders) => _$this._orders = orders;

  bool? _isOrdersTimesLoading;
  bool? get isOrdersTimesLoading => _$this._isOrdersTimesLoading;
  set isOrdersTimesLoading(bool? isOrdersTimesLoading) =>
      _$this._isOrdersTimesLoading = isOrdersTimesLoading;

  bool? _isTimeOrdersLoading;
  bool? get isTimeOrdersLoading => _$this._isTimeOrdersLoading;
  set isTimeOrdersLoading(bool? isTimeOrdersLoading) =>
      _$this._isTimeOrdersLoading = isTimeOrdersLoading;

  OrdersStateBuilder();

  OrdersStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _message = $v.message;
      _error = $v.error;
      _times = $v.times;
      _orders = $v.orders;
      _isOrdersTimesLoading = $v.isOrdersTimesLoading;
      _isTimeOrdersLoading = $v.isTimeOrdersLoading;
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
    final _$result = _$v ??
        new _$OrdersState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'OrdersState', 'isLoading'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'OrdersState', 'message'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'OrdersState', 'error'),
            times: BuiltValueNullFieldError.checkNotNull(
                times, r'OrdersState', 'times'),
            orders: BuiltValueNullFieldError.checkNotNull(
                orders, r'OrdersState', 'orders'),
            isOrdersTimesLoading: BuiltValueNullFieldError.checkNotNull(
                isOrdersTimesLoading, r'OrdersState', 'isOrdersTimesLoading'),
            isTimeOrdersLoading: BuiltValueNullFieldError.checkNotNull(
                isTimeOrdersLoading, r'OrdersState', 'isTimeOrdersLoading'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
