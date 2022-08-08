// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final bool isLoading;
  @override
  final String message;
  @override
  final bool error;
  @override
  final bool active;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates))._build();

  _$HomeState._(
      {required this.isLoading,
      required this.message,
      required this.error,
      required this.active})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, r'HomeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(message, r'HomeState', 'message');
    BuiltValueNullFieldError.checkNotNull(error, r'HomeState', 'error');
    BuiltValueNullFieldError.checkNotNull(active, r'HomeState', 'active');
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        isLoading == other.isLoading &&
        message == other.message &&
        error == other.error &&
        active == other.active;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), message.hashCode), error.hashCode),
        active.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeState')
          ..add('isLoading', isLoading)
          ..add('message', message)
          ..add('error', error)
          ..add('active', active))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _message = $v.message;
      _error = $v.error;
      _active = $v.active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeState build() => _build();

  _$HomeState _build() {
    final _$result = _$v ??
        new _$HomeState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'HomeState', 'isLoading'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'HomeState', 'message'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'HomeState', 'error'),
            active: BuiltValueNullFieldError.checkNotNull(
                active, r'HomeState', 'active'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
