// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileState extends ProfileState {
  @override
  final String message;
  @override
  final bool error;
  @override
  final bool isLoading;
  @override
  final bool isLoggedOut;
  @override
  final XFile? pickedImage;
  @override
  final PaginationStateData<PreparedOrder> preparedOrder;
  @override
  final BuiltList<OrderMealNote> orderMealsNotes;
  @override
  final ChefBalance? chefBalance;
  @override
  final Profile? profile;
  @override
  final bool pop;

  factory _$ProfileState([void Function(ProfileStateBuilder)? updates]) =>
      (new ProfileStateBuilder()..update(updates))._build();

  _$ProfileState._(
      {required this.message,
      required this.error,
      required this.isLoading,
      required this.isLoggedOut,
      this.pickedImage,
      required this.preparedOrder,
      required this.orderMealsNotes,
      this.chefBalance,
      this.profile,
      required this.pop})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(message, r'ProfileState', 'message');
    BuiltValueNullFieldError.checkNotNull(error, r'ProfileState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ProfileState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isLoggedOut, r'ProfileState', 'isLoggedOut');
    BuiltValueNullFieldError.checkNotNull(
        preparedOrder, r'ProfileState', 'preparedOrder');
    BuiltValueNullFieldError.checkNotNull(
        orderMealsNotes, r'ProfileState', 'orderMealsNotes');
    BuiltValueNullFieldError.checkNotNull(pop, r'ProfileState', 'pop');
  }

  @override
  ProfileState rebuild(void Function(ProfileStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileStateBuilder toBuilder() => new ProfileStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileState &&
        message == other.message &&
        error == other.error &&
        isLoading == other.isLoading &&
        isLoggedOut == other.isLoggedOut &&
        pickedImage == other.pickedImage &&
        preparedOrder == other.preparedOrder &&
        orderMealsNotes == other.orderMealsNotes &&
        chefBalance == other.chefBalance &&
        profile == other.profile &&
        pop == other.pop;
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
                                    $jc($jc(0, message.hashCode),
                                        error.hashCode),
                                    isLoading.hashCode),
                                isLoggedOut.hashCode),
                            pickedImage.hashCode),
                        preparedOrder.hashCode),
                    orderMealsNotes.hashCode),
                chefBalance.hashCode),
            profile.hashCode),
        pop.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileState')
          ..add('message', message)
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('isLoggedOut', isLoggedOut)
          ..add('pickedImage', pickedImage)
          ..add('preparedOrder', preparedOrder)
          ..add('orderMealsNotes', orderMealsNotes)
          ..add('chefBalance', chefBalance)
          ..add('profile', profile)
          ..add('pop', pop))
        .toString();
  }
}

class ProfileStateBuilder
    implements Builder<ProfileState, ProfileStateBuilder> {
  _$ProfileState? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isLoggedOut;
  bool? get isLoggedOut => _$this._isLoggedOut;
  set isLoggedOut(bool? isLoggedOut) => _$this._isLoggedOut = isLoggedOut;

  XFile? _pickedImage;
  XFile? get pickedImage => _$this._pickedImage;
  set pickedImage(XFile? pickedImage) => _$this._pickedImage = pickedImage;

  PaginationStateDataBuilder<PreparedOrder>? _preparedOrder;
  PaginationStateDataBuilder<PreparedOrder> get preparedOrder =>
      _$this._preparedOrder ??= new PaginationStateDataBuilder<PreparedOrder>();
  set preparedOrder(PaginationStateDataBuilder<PreparedOrder>? preparedOrder) =>
      _$this._preparedOrder = preparedOrder;

  ListBuilder<OrderMealNote>? _orderMealsNotes;
  ListBuilder<OrderMealNote> get orderMealsNotes =>
      _$this._orderMealsNotes ??= new ListBuilder<OrderMealNote>();
  set orderMealsNotes(ListBuilder<OrderMealNote>? orderMealsNotes) =>
      _$this._orderMealsNotes = orderMealsNotes;

  ChefBalance? _chefBalance;
  ChefBalance? get chefBalance => _$this._chefBalance;
  set chefBalance(ChefBalance? chefBalance) =>
      _$this._chefBalance = chefBalance;

  Profile? _profile;
  Profile? get profile => _$this._profile;
  set profile(Profile? profile) => _$this._profile = profile;

  bool? _pop;
  bool? get pop => _$this._pop;
  set pop(bool? pop) => _$this._pop = pop;

  ProfileStateBuilder();

  ProfileStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _error = $v.error;
      _isLoading = $v.isLoading;
      _isLoggedOut = $v.isLoggedOut;
      _pickedImage = $v.pickedImage;
      _preparedOrder = $v.preparedOrder.toBuilder();
      _orderMealsNotes = $v.orderMealsNotes.toBuilder();
      _chefBalance = $v.chefBalance;
      _profile = $v.profile;
      _pop = $v.pop;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileState;
  }

  @override
  void update(void Function(ProfileStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileState build() => _build();

  _$ProfileState _build() {
    _$ProfileState _$result;
    try {
      _$result = _$v ??
          new _$ProfileState._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'ProfileState', 'message'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'ProfileState', 'error'),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'ProfileState', 'isLoading'),
              isLoggedOut: BuiltValueNullFieldError.checkNotNull(
                  isLoggedOut, r'ProfileState', 'isLoggedOut'),
              pickedImage: pickedImage,
              preparedOrder: preparedOrder.build(),
              orderMealsNotes: orderMealsNotes.build(),
              chefBalance: chefBalance,
              profile: profile,
              pop: BuiltValueNullFieldError.checkNotNull(
                  pop, r'ProfileState', 'pop'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'preparedOrder';
        preparedOrder.build();
        _$failedField = 'orderMealsNotes';
        orderMealsNotes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProfileState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
