// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscriptionsState extends SubscriptionsState {
  @override
  final List<Subscription> subscriptions;
  @override
  final BuiltList<AddSubscriptionMeal> meals;
  @override
  final bool isLoading;
  @override
  final bool error;
  @override
  final String message;

  factory _$SubscriptionsState(
          [void Function(SubscriptionsStateBuilder)? updates]) =>
      (new SubscriptionsStateBuilder()..update(updates))._build();

  _$SubscriptionsState._(
      {required this.subscriptions,
      required this.meals,
      required this.isLoading,
      required this.error,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        subscriptions, r'SubscriptionsState', 'subscriptions');
    BuiltValueNullFieldError.checkNotNull(
        meals, r'SubscriptionsState', 'meals');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'SubscriptionsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        error, r'SubscriptionsState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        message, r'SubscriptionsState', 'message');
  }

  @override
  SubscriptionsState rebuild(
          void Function(SubscriptionsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionsStateBuilder toBuilder() =>
      new SubscriptionsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionsState &&
        subscriptions == other.subscriptions &&
        meals == other.meals &&
        isLoading == other.isLoading &&
        error == other.error &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, subscriptions.hashCode), meals.hashCode),
                isLoading.hashCode),
            error.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionsState')
          ..add('subscriptions', subscriptions)
          ..add('meals', meals)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('message', message))
        .toString();
  }
}

class SubscriptionsStateBuilder
    implements Builder<SubscriptionsState, SubscriptionsStateBuilder> {
  _$SubscriptionsState? _$v;

  List<Subscription>? _subscriptions;
  List<Subscription>? get subscriptions => _$this._subscriptions;
  set subscriptions(List<Subscription>? subscriptions) =>
      _$this._subscriptions = subscriptions;

  ListBuilder<AddSubscriptionMeal>? _meals;
  ListBuilder<AddSubscriptionMeal> get meals =>
      _$this._meals ??= new ListBuilder<AddSubscriptionMeal>();
  set meals(ListBuilder<AddSubscriptionMeal>? meals) => _$this._meals = meals;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  SubscriptionsStateBuilder();

  SubscriptionsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subscriptions = $v.subscriptions;
      _meals = $v.meals.toBuilder();
      _isLoading = $v.isLoading;
      _error = $v.error;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionsState;
  }

  @override
  void update(void Function(SubscriptionsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionsState build() => _build();

  _$SubscriptionsState _build() {
    _$SubscriptionsState _$result;
    try {
      _$result = _$v ??
          new _$SubscriptionsState._(
              subscriptions: BuiltValueNullFieldError.checkNotNull(
                  subscriptions, r'SubscriptionsState', 'subscriptions'),
              meals: meals.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'SubscriptionsState', 'isLoading'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'SubscriptionsState', 'error'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'SubscriptionsState', 'message'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meals';
        meals.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SubscriptionsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
