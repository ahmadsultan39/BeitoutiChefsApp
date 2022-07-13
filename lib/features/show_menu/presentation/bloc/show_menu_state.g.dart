// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_menu_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShowMenuState extends ShowMenuState {
  @override
  final List<Category> categories;
  @override
  final Map<int, List<Meal>> meals;
  @override
  final MealsInfo mealsInfo;
  @override
  final bool isLoading;
  @override
  final bool error;
  @override
  final String message;

  factory _$ShowMenuState([void Function(ShowMenuStateBuilder)? updates]) =>
      (new ShowMenuStateBuilder()..update(updates))._build();

  _$ShowMenuState._(
      {required this.categories,
      required this.meals,
      required this.mealsInfo,
      required this.isLoading,
      required this.error,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categories, r'ShowMenuState', 'categories');
    BuiltValueNullFieldError.checkNotNull(meals, r'ShowMenuState', 'meals');
    BuiltValueNullFieldError.checkNotNull(
        mealsInfo, r'ShowMenuState', 'mealsInfo');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ShowMenuState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'ShowMenuState', 'error');
    BuiltValueNullFieldError.checkNotNull(message, r'ShowMenuState', 'message');
  }

  @override
  ShowMenuState rebuild(void Function(ShowMenuStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowMenuStateBuilder toBuilder() => new ShowMenuStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowMenuState &&
        categories == other.categories &&
        meals == other.meals &&
        mealsInfo == other.mealsInfo &&
        isLoading == other.isLoading &&
        error == other.error &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, categories.hashCode), meals.hashCode),
                    mealsInfo.hashCode),
                isLoading.hashCode),
            error.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShowMenuState')
          ..add('categories', categories)
          ..add('meals', meals)
          ..add('mealsInfo', mealsInfo)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('message', message))
        .toString();
  }
}

class ShowMenuStateBuilder
    implements Builder<ShowMenuState, ShowMenuStateBuilder> {
  _$ShowMenuState? _$v;

  List<Category>? _categories;
  List<Category>? get categories => _$this._categories;
  set categories(List<Category>? categories) => _$this._categories = categories;

  Map<int, List<Meal>>? _meals;
  Map<int, List<Meal>>? get meals => _$this._meals;
  set meals(Map<int, List<Meal>>? meals) => _$this._meals = meals;

  MealsInfo? _mealsInfo;
  MealsInfo? get mealsInfo => _$this._mealsInfo;
  set mealsInfo(MealsInfo? mealsInfo) => _$this._mealsInfo = mealsInfo;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ShowMenuStateBuilder();

  ShowMenuStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categories = $v.categories;
      _meals = $v.meals;
      _mealsInfo = $v.mealsInfo;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowMenuState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShowMenuState;
  }

  @override
  void update(void Function(ShowMenuStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShowMenuState build() => _build();

  _$ShowMenuState _build() {
    final _$result = _$v ??
        new _$ShowMenuState._(
            categories: BuiltValueNullFieldError.checkNotNull(
                categories, r'ShowMenuState', 'categories'),
            meals: BuiltValueNullFieldError.checkNotNull(
                meals, r'ShowMenuState', 'meals'),
            mealsInfo: BuiltValueNullFieldError.checkNotNull(
                mealsInfo, r'ShowMenuState', 'mealsInfo'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'ShowMenuState', 'isLoading'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'ShowMenuState', 'error'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ShowMenuState', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
