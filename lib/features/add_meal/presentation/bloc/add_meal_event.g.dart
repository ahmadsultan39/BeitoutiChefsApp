// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_meal_event.dart';

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
    return newBuiltValueToStringHelper('GetCategoriesEvent').toString();
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

class _$GetFinalPriceEvent extends GetFinalPriceEvent {
  @override
  final int price;

  factory _$GetFinalPriceEvent(
          [void Function(GetFinalPriceEventBuilder)? updates]) =>
      (new GetFinalPriceEventBuilder()..update(updates))._build();

  _$GetFinalPriceEvent._({required this.price}) : super._() {
    BuiltValueNullFieldError.checkNotNull(price, 'GetFinalPriceEvent', 'price');
  }

  @override
  GetFinalPriceEvent rebuild(
          void Function(GetFinalPriceEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetFinalPriceEventBuilder toBuilder() =>
      new GetFinalPriceEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetFinalPriceEvent && price == other.price;
  }

  @override
  int get hashCode {
    return $jf($jc(0, price.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetFinalPriceEvent')
          ..add('price', price))
        .toString();
  }
}

class GetFinalPriceEventBuilder
    implements Builder<GetFinalPriceEvent, GetFinalPriceEventBuilder> {
  _$GetFinalPriceEvent? _$v;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  GetFinalPriceEventBuilder();

  GetFinalPriceEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _price = $v.price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetFinalPriceEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetFinalPriceEvent;
  }

  @override
  void update(void Function(GetFinalPriceEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetFinalPriceEvent build() => _build();

  _$GetFinalPriceEvent _build() {
    final _$result = _$v ??
        new _$GetFinalPriceEvent._(
            price: BuiltValueNullFieldError.checkNotNull(
                price, 'GetFinalPriceEvent', 'price'));
    replace(_$result);
    return _$result;
  }
}

class _$AddCategoryEvent extends AddCategoryEvent {
  @override
  final String name;

  factory _$AddCategoryEvent(
          [void Function(AddCategoryEventBuilder)? updates]) =>
      (new AddCategoryEventBuilder()..update(updates))._build();

  _$AddCategoryEvent._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'AddCategoryEvent', 'name');
  }

  @override
  AddCategoryEvent rebuild(void Function(AddCategoryEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddCategoryEventBuilder toBuilder() =>
      new AddCategoryEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddCategoryEvent && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddCategoryEvent')..add('name', name))
        .toString();
  }
}

class AddCategoryEventBuilder
    implements Builder<AddCategoryEvent, AddCategoryEventBuilder> {
  _$AddCategoryEvent? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  AddCategoryEventBuilder();

  AddCategoryEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddCategoryEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddCategoryEvent;
  }

  @override
  void update(void Function(AddCategoryEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddCategoryEvent build() => _build();

  _$AddCategoryEvent _build() {
    final _$result = _$v ??
        new _$AddCategoryEvent._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'AddCategoryEvent', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$AddNewMealEvent extends AddNewMealEvent {
  @override
  final AddMealUseCaseParams mealData;

  factory _$AddNewMealEvent([void Function(AddNewMealEventBuilder)? updates]) =>
      (new AddNewMealEventBuilder()..update(updates))._build();

  _$AddNewMealEvent._({required this.mealData}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        mealData, 'AddNewMealEvent', 'mealData');
  }

  @override
  AddNewMealEvent rebuild(void Function(AddNewMealEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddNewMealEventBuilder toBuilder() =>
      new AddNewMealEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddNewMealEvent && mealData == other.mealData;
  }

  @override
  int get hashCode {
    return $jf($jc(0, mealData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddNewMealEvent')
          ..add('mealData', mealData))
        .toString();
  }
}

class AddNewMealEventBuilder
    implements Builder<AddNewMealEvent, AddNewMealEventBuilder> {
  _$AddNewMealEvent? _$v;

  AddMealUseCaseParams? _mealData;
  AddMealUseCaseParams? get mealData => _$this._mealData;
  set mealData(AddMealUseCaseParams? mealData) => _$this._mealData = mealData;

  AddNewMealEventBuilder();

  AddNewMealEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mealData = $v.mealData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddNewMealEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddNewMealEvent;
  }

  @override
  void update(void Function(AddNewMealEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddNewMealEvent build() => _build();

  _$AddNewMealEvent _build() {
    final _$result = _$v ??
        new _$AddNewMealEvent._(
            mealData: BuiltValueNullFieldError.checkNotNull(
                mealData, 'AddNewMealEvent', 'mealData'));
    replace(_$result);
    return _$result;
  }
}

class _$EditMealEvent extends EditMealEvent {
  @override
  final EditMealUseCaseParams mealData;

  factory _$EditMealEvent([void Function(EditMealEventBuilder)? updates]) =>
      (new EditMealEventBuilder()..update(updates))._build();

  _$EditMealEvent._({required this.mealData}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        mealData, 'EditMealEvent', 'mealData');
  }

  @override
  EditMealEvent rebuild(void Function(EditMealEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditMealEventBuilder toBuilder() => new EditMealEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditMealEvent && mealData == other.mealData;
  }

  @override
  int get hashCode {
    return $jf($jc(0, mealData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EditMealEvent')
          ..add('mealData', mealData))
        .toString();
  }
}

class EditMealEventBuilder
    implements Builder<EditMealEvent, EditMealEventBuilder> {
  _$EditMealEvent? _$v;

  EditMealUseCaseParams? _mealData;
  EditMealUseCaseParams? get mealData => _$this._mealData;
  set mealData(EditMealUseCaseParams? mealData) => _$this._mealData = mealData;

  EditMealEventBuilder();

  EditMealEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mealData = $v.mealData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditMealEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditMealEvent;
  }

  @override
  void update(void Function(EditMealEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditMealEvent build() => _build();

  _$EditMealEvent _build() {
    final _$result = _$v ??
        new _$EditMealEvent._(
            mealData: BuiltValueNullFieldError.checkNotNull(
                mealData, 'EditMealEvent', 'mealData'));
    replace(_$result);
    return _$result;
  }
}

class _$PickImage extends PickImage {
  factory _$PickImage([void Function(PickImageBuilder)? updates]) =>
      (new PickImageBuilder()..update(updates))._build();

  _$PickImage._() : super._();

  @override
  PickImage rebuild(void Function(PickImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PickImageBuilder toBuilder() => new PickImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PickImage;
  }

  @override
  int get hashCode {
    return 618242274;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PickImage').toString();
  }
}

class PickImageBuilder implements Builder<PickImage, PickImageBuilder> {
  _$PickImage? _$v;

  PickImageBuilder();

  @override
  void replace(PickImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PickImage;
  }

  @override
  void update(void Function(PickImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PickImage build() => _build();

  _$PickImage _build() {
    final _$result = _$v ?? new _$PickImage._();
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
    return newBuiltValueToStringHelper('ClearError').toString();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
