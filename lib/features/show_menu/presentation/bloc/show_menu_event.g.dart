// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_menu_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetCategoriesEvent extends GetCategoriesEvent {
  factory _$GetCategoriesEvent(
          [void Function(GetCategoriesEventBuilder)? updates]) =>
      (new GetCategoriesEventBuilder()..update(updates))._build();

  _$GetCategoriesEvent._() : super._();

  @override
  GetCategoriesEvent rebuild(
          void Function(GetCategoriesEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCategoriesEventBuilder toBuilder() =>
      new GetCategoriesEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCategoriesEvent;
  }

  @override
  int get hashCode {
    return 899810148;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetCategoriesEvent').toString();
  }
}

class GetCategoriesEventBuilder
    implements Builder<GetCategoriesEvent, GetCategoriesEventBuilder> {
  _$GetCategoriesEvent? _$v;

  GetCategoriesEventBuilder();

  @override
  void replace(GetCategoriesEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCategoriesEvent;
  }

  @override
  void update(void Function(GetCategoriesEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCategoriesEvent build() => _build();

  _$GetCategoriesEvent _build() {
    final _$result = _$v ?? new _$GetCategoriesEvent._();
    replace(_$result);
    return _$result;
  }
}

class _$GetActiveMealsCountEvent extends GetActiveMealsCountEvent {
  factory _$GetActiveMealsCountEvent(
          [void Function(GetActiveMealsCountEventBuilder)? updates]) =>
      (new GetActiveMealsCountEventBuilder()..update(updates))._build();

  _$GetActiveMealsCountEvent._() : super._();

  @override
  GetActiveMealsCountEvent rebuild(
          void Function(GetActiveMealsCountEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetActiveMealsCountEventBuilder toBuilder() =>
      new GetActiveMealsCountEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetActiveMealsCountEvent;
  }

  @override
  int get hashCode {
    return 859916678;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetActiveMealsCountEvent').toString();
  }
}

class GetActiveMealsCountEventBuilder
    implements
        Builder<GetActiveMealsCountEvent, GetActiveMealsCountEventBuilder> {
  _$GetActiveMealsCountEvent? _$v;

  GetActiveMealsCountEventBuilder();

  @override
  void replace(GetActiveMealsCountEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetActiveMealsCountEvent;
  }

  @override
  void update(void Function(GetActiveMealsCountEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetActiveMealsCountEvent build() => _build();

  _$GetActiveMealsCountEvent _build() {
    final _$result = _$v ?? new _$GetActiveMealsCountEvent._();
    replace(_$result);
    return _$result;
  }
}

class _$GetCategoryMealsEvent extends GetCategoryMealsEvent {
  @override
  final int categoryId;

  factory _$GetCategoryMealsEvent(
          [void Function(GetCategoryMealsEventBuilder)? updates]) =>
      (new GetCategoryMealsEventBuilder()..update(updates))._build();

  _$GetCategoryMealsEvent._({required this.categoryId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'GetCategoryMealsEvent', 'categoryId');
  }

  @override
  GetCategoryMealsEvent rebuild(
          void Function(GetCategoryMealsEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCategoryMealsEventBuilder toBuilder() =>
      new GetCategoryMealsEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCategoryMealsEvent && categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, categoryId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetCategoryMealsEvent')
          ..add('categoryId', categoryId))
        .toString();
  }
}

class GetCategoryMealsEventBuilder
    implements Builder<GetCategoryMealsEvent, GetCategoryMealsEventBuilder> {
  _$GetCategoryMealsEvent? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  GetCategoryMealsEventBuilder();

  GetCategoryMealsEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetCategoryMealsEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCategoryMealsEvent;
  }

  @override
  void update(void Function(GetCategoryMealsEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCategoryMealsEvent build() => _build();

  _$GetCategoryMealsEvent _build() {
    final _$result = _$v ??
        new _$GetCategoryMealsEvent._(
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'GetCategoryMealsEvent', 'categoryId'));
    replace(_$result);
    return _$result;
  }
}

class _$IncreaseMaxMealNumberEvent extends IncreaseMaxMealNumberEvent {
  @override
  final int mealId;
  @override
  final int categoryId;

  factory _$IncreaseMaxMealNumberEvent(
          [void Function(IncreaseMaxMealNumberEventBuilder)? updates]) =>
      (new IncreaseMaxMealNumberEventBuilder()..update(updates))._build();

  _$IncreaseMaxMealNumberEvent._(
      {required this.mealId, required this.categoryId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        mealId, r'IncreaseMaxMealNumberEvent', 'mealId');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'IncreaseMaxMealNumberEvent', 'categoryId');
  }

  @override
  IncreaseMaxMealNumberEvent rebuild(
          void Function(IncreaseMaxMealNumberEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IncreaseMaxMealNumberEventBuilder toBuilder() =>
      new IncreaseMaxMealNumberEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IncreaseMaxMealNumberEvent &&
        mealId == other.mealId &&
        categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, mealId.hashCode), categoryId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IncreaseMaxMealNumberEvent')
          ..add('mealId', mealId)
          ..add('categoryId', categoryId))
        .toString();
  }
}

class IncreaseMaxMealNumberEventBuilder
    implements
        Builder<IncreaseMaxMealNumberEvent, IncreaseMaxMealNumberEventBuilder> {
  _$IncreaseMaxMealNumberEvent? _$v;

  int? _mealId;
  int? get mealId => _$this._mealId;
  set mealId(int? mealId) => _$this._mealId = mealId;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  IncreaseMaxMealNumberEventBuilder();

  IncreaseMaxMealNumberEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mealId = $v.mealId;
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IncreaseMaxMealNumberEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IncreaseMaxMealNumberEvent;
  }

  @override
  void update(void Function(IncreaseMaxMealNumberEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IncreaseMaxMealNumberEvent build() => _build();

  _$IncreaseMaxMealNumberEvent _build() {
    final _$result = _$v ??
        new _$IncreaseMaxMealNumberEvent._(
            mealId: BuiltValueNullFieldError.checkNotNull(
                mealId, r'IncreaseMaxMealNumberEvent', 'mealId'),
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'IncreaseMaxMealNumberEvent', 'categoryId'));
    replace(_$result);
    return _$result;
  }
}

class _$DecreaseMaxMealNumberEvent extends DecreaseMaxMealNumberEvent {
  @override
  final int mealId;
  @override
  final int categoryId;

  factory _$DecreaseMaxMealNumberEvent(
          [void Function(DecreaseMaxMealNumberEventBuilder)? updates]) =>
      (new DecreaseMaxMealNumberEventBuilder()..update(updates))._build();

  _$DecreaseMaxMealNumberEvent._(
      {required this.mealId, required this.categoryId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        mealId, r'DecreaseMaxMealNumberEvent', 'mealId');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'DecreaseMaxMealNumberEvent', 'categoryId');
  }

  @override
  DecreaseMaxMealNumberEvent rebuild(
          void Function(DecreaseMaxMealNumberEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DecreaseMaxMealNumberEventBuilder toBuilder() =>
      new DecreaseMaxMealNumberEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DecreaseMaxMealNumberEvent &&
        mealId == other.mealId &&
        categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, mealId.hashCode), categoryId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DecreaseMaxMealNumberEvent')
          ..add('mealId', mealId)
          ..add('categoryId', categoryId))
        .toString();
  }
}

class DecreaseMaxMealNumberEventBuilder
    implements
        Builder<DecreaseMaxMealNumberEvent, DecreaseMaxMealNumberEventBuilder> {
  _$DecreaseMaxMealNumberEvent? _$v;

  int? _mealId;
  int? get mealId => _$this._mealId;
  set mealId(int? mealId) => _$this._mealId = mealId;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  DecreaseMaxMealNumberEventBuilder();

  DecreaseMaxMealNumberEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mealId = $v.mealId;
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DecreaseMaxMealNumberEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DecreaseMaxMealNumberEvent;
  }

  @override
  void update(void Function(DecreaseMaxMealNumberEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DecreaseMaxMealNumberEvent build() => _build();

  _$DecreaseMaxMealNumberEvent _build() {
    final _$result = _$v ??
        new _$DecreaseMaxMealNumberEvent._(
            mealId: BuiltValueNullFieldError.checkNotNull(
                mealId, r'DecreaseMaxMealNumberEvent', 'mealId'),
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'DecreaseMaxMealNumberEvent', 'categoryId'));
    replace(_$result);
    return _$result;
  }
}

class _$ChangeMealAvailabilityEvent extends ChangeMealAvailabilityEvent {
  @override
  final int mealId;
  @override
  final int categoryId;

  factory _$ChangeMealAvailabilityEvent(
          [void Function(ChangeMealAvailabilityEventBuilder)? updates]) =>
      (new ChangeMealAvailabilityEventBuilder()..update(updates))._build();

  _$ChangeMealAvailabilityEvent._(
      {required this.mealId, required this.categoryId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        mealId, r'ChangeMealAvailabilityEvent', 'mealId');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'ChangeMealAvailabilityEvent', 'categoryId');
  }

  @override
  ChangeMealAvailabilityEvent rebuild(
          void Function(ChangeMealAvailabilityEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeMealAvailabilityEventBuilder toBuilder() =>
      new ChangeMealAvailabilityEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeMealAvailabilityEvent &&
        mealId == other.mealId &&
        categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, mealId.hashCode), categoryId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeMealAvailabilityEvent')
          ..add('mealId', mealId)
          ..add('categoryId', categoryId))
        .toString();
  }
}

class ChangeMealAvailabilityEventBuilder
    implements
        Builder<ChangeMealAvailabilityEvent,
            ChangeMealAvailabilityEventBuilder> {
  _$ChangeMealAvailabilityEvent? _$v;

  int? _mealId;
  int? get mealId => _$this._mealId;
  set mealId(int? mealId) => _$this._mealId = mealId;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  ChangeMealAvailabilityEventBuilder();

  ChangeMealAvailabilityEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mealId = $v.mealId;
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeMealAvailabilityEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeMealAvailabilityEvent;
  }

  @override
  void update(void Function(ChangeMealAvailabilityEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeMealAvailabilityEvent build() => _build();

  _$ChangeMealAvailabilityEvent _build() {
    final _$result = _$v ??
        new _$ChangeMealAvailabilityEvent._(
            mealId: BuiltValueNullFieldError.checkNotNull(
                mealId, r'ChangeMealAvailabilityEvent', 'mealId'),
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'ChangeMealAvailabilityEvent', 'categoryId'));
    replace(_$result);
    return _$result;
  }
}

class _$DeleteMealEvent extends DeleteMealEvent {
  @override
  final int mealId;
  @override
  final int categoryId;

  factory _$DeleteMealEvent([void Function(DeleteMealEventBuilder)? updates]) =>
      (new DeleteMealEventBuilder()..update(updates))._build();

  _$DeleteMealEvent._({required this.mealId, required this.categoryId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(mealId, r'DeleteMealEvent', 'mealId');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'DeleteMealEvent', 'categoryId');
  }

  @override
  DeleteMealEvent rebuild(void Function(DeleteMealEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteMealEventBuilder toBuilder() =>
      new DeleteMealEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteMealEvent &&
        mealId == other.mealId &&
        categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, mealId.hashCode), categoryId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteMealEvent')
          ..add('mealId', mealId)
          ..add('categoryId', categoryId))
        .toString();
  }
}

class DeleteMealEventBuilder
    implements Builder<DeleteMealEvent, DeleteMealEventBuilder> {
  _$DeleteMealEvent? _$v;

  int? _mealId;
  int? get mealId => _$this._mealId;
  set mealId(int? mealId) => _$this._mealId = mealId;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  DeleteMealEventBuilder();

  DeleteMealEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mealId = $v.mealId;
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteMealEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteMealEvent;
  }

  @override
  void update(void Function(DeleteMealEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteMealEvent build() => _build();

  _$DeleteMealEvent _build() {
    final _$result = _$v ??
        new _$DeleteMealEvent._(
            mealId: BuiltValueNullFieldError.checkNotNull(
                mealId, r'DeleteMealEvent', 'mealId'),
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'DeleteMealEvent', 'categoryId'));
    replace(_$result);
    return _$result;
  }
}

class _$ClearError extends ClearError {
  factory _$ClearError([void Function(ClearErrorBuilder)? updates]) =>
      (new ClearErrorBuilder()..update(updates))._build();

  _$ClearError._() : super._();

  @override
  ClearError rebuild(void Function(ClearErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearErrorBuilder toBuilder() => new ClearErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearError;
  }

  @override
  int get hashCode {
    return 507656265;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearError').toString();
  }
}

class ClearErrorBuilder implements Builder<ClearError, ClearErrorBuilder> {
  _$ClearError? _$v;

  ClearErrorBuilder();

  @override
  void replace(ClearError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearError;
  }

  @override
  void update(void Function(ClearErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearError build() => _build();

  _$ClearError _build() {
    final _$result = _$v ?? new _$ClearError._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
