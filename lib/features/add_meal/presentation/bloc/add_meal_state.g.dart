// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_meal_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddMealState extends AddMealState {
  @override
  final bool isLoading;
  @override
  final String? imageUrl;
  @override
  final XFile? pickedImage;
  @override
  final String? name;
  @override
  final String? category;
  @override
  final String? ingredients;
  @override
  final int? preparingTime;
  @override
  final int? maxMeals;
  @override
  final int? price;
  @override
  final int? finalPrice;
  @override
  final double? discount;
  @override
  final bool isCategoriesLoading;
  @override
  final List<Category> categories;
  @override
  final bool error;
  @override
  final String message;

  factory _$AddMealState([void Function(AddMealStateBuilder)? updates]) =>
      (new AddMealStateBuilder()..update(updates))._build();

  _$AddMealState._(
      {required this.isLoading,
      this.imageUrl,
      this.pickedImage,
      this.name,
      this.category,
      this.ingredients,
      this.preparingTime,
      this.maxMeals,
      this.price,
      this.finalPrice,
      this.discount,
      required this.isCategoriesLoading,
      required this.categories,
      required this.error,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'AddMealState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isCategoriesLoading, 'AddMealState', 'isCategoriesLoading');
    BuiltValueNullFieldError.checkNotNull(
        categories, 'AddMealState', 'categories');
    BuiltValueNullFieldError.checkNotNull(error, 'AddMealState', 'error');
    BuiltValueNullFieldError.checkNotNull(message, 'AddMealState', 'message');
  }

  @override
  AddMealState rebuild(void Function(AddMealStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddMealStateBuilder toBuilder() => new AddMealStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddMealState &&
        isLoading == other.isLoading &&
        imageUrl == other.imageUrl &&
        pickedImage == other.pickedImage &&
        name == other.name &&
        category == other.category &&
        ingredients == other.ingredients &&
        preparingTime == other.preparingTime &&
        maxMeals == other.maxMeals &&
        price == other.price &&
        finalPrice == other.finalPrice &&
        discount == other.discount &&
        isCategoriesLoading == other.isCategoriesLoading &&
        categories == other.categories &&
        error == other.error &&
        message == other.message;
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                isLoading
                                                                    .hashCode),
                                                            imageUrl.hashCode),
                                                        pickedImage.hashCode),
                                                    name.hashCode),
                                                category.hashCode),
                                            ingredients.hashCode),
                                        preparingTime.hashCode),
                                    maxMeals.hashCode),
                                price.hashCode),
                            finalPrice.hashCode),
                        discount.hashCode),
                    isCategoriesLoading.hashCode),
                categories.hashCode),
            error.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddMealState')
          ..add('isLoading', isLoading)
          ..add('imageUrl', imageUrl)
          ..add('pickedImage', pickedImage)
          ..add('name', name)
          ..add('category', category)
          ..add('ingredients', ingredients)
          ..add('preparingTime', preparingTime)
          ..add('maxMeals', maxMeals)
          ..add('price', price)
          ..add('finalPrice', finalPrice)
          ..add('discount', discount)
          ..add('isCategoriesLoading', isCategoriesLoading)
          ..add('categories', categories)
          ..add('error', error)
          ..add('message', message))
        .toString();
  }
}

class AddMealStateBuilder
    implements Builder<AddMealState, AddMealStateBuilder> {
  _$AddMealState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  XFile? _pickedImage;
  XFile? get pickedImage => _$this._pickedImage;
  set pickedImage(XFile? pickedImage) => _$this._pickedImage = pickedImage;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _ingredients;
  String? get ingredients => _$this._ingredients;
  set ingredients(String? ingredients) => _$this._ingredients = ingredients;

  int? _preparingTime;
  int? get preparingTime => _$this._preparingTime;
  set preparingTime(int? preparingTime) =>
      _$this._preparingTime = preparingTime;

  int? _maxMeals;
  int? get maxMeals => _$this._maxMeals;
  set maxMeals(int? maxMeals) => _$this._maxMeals = maxMeals;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  int? _finalPrice;
  int? get finalPrice => _$this._finalPrice;
  set finalPrice(int? finalPrice) => _$this._finalPrice = finalPrice;

  double? _discount;
  double? get discount => _$this._discount;
  set discount(double? discount) => _$this._discount = discount;

  bool? _isCategoriesLoading;
  bool? get isCategoriesLoading => _$this._isCategoriesLoading;
  set isCategoriesLoading(bool? isCategoriesLoading) =>
      _$this._isCategoriesLoading = isCategoriesLoading;

  List<Category>? _categories;
  List<Category>? get categories => _$this._categories;
  set categories(List<Category>? categories) => _$this._categories = categories;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AddMealStateBuilder();

  AddMealStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _imageUrl = $v.imageUrl;
      _pickedImage = $v.pickedImage;
      _name = $v.name;
      _category = $v.category;
      _ingredients = $v.ingredients;
      _preparingTime = $v.preparingTime;
      _maxMeals = $v.maxMeals;
      _price = $v.price;
      _finalPrice = $v.finalPrice;
      _discount = $v.discount;
      _isCategoriesLoading = $v.isCategoriesLoading;
      _categories = $v.categories;
      _error = $v.error;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddMealState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddMealState;
  }

  @override
  void update(void Function(AddMealStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddMealState build() => _build();

  _$AddMealState _build() {
    final _$result = _$v ??
        new _$AddMealState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, 'AddMealState', 'isLoading'),
            imageUrl: imageUrl,
            pickedImage: pickedImage,
            name: name,
            category: category,
            ingredients: ingredients,
            preparingTime: preparingTime,
            maxMeals: maxMeals,
            price: price,
            finalPrice: finalPrice,
            discount: discount,
            isCategoriesLoading: BuiltValueNullFieldError.checkNotNull(
                isCategoriesLoading, 'AddMealState', 'isCategoriesLoading'),
            categories: BuiltValueNullFieldError.checkNotNull(
                categories, 'AddMealState', 'categories'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, 'AddMealState', 'error'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'AddMealState', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
