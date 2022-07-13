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
  final ProfilePagesState profilePagesState;
  @override
  final BuiltList<OrderMealNote> orderMealsNotes;
  @override
  final BuiltList<PreparedOrder> preparedOrder;
  @override
  final ChefBalance? chefBalance;
  @override
  final Profile? profile;

  factory _$ProfileState([void Function(ProfileStateBuilder)? updates]) =>
      (new ProfileStateBuilder()..update(updates))._build();

  _$ProfileState._(
      {required this.message,
      required this.error,
      required this.isLoading,
      required this.isLoggedOut,
      required this.profilePagesState,
      required this.orderMealsNotes,
      required this.preparedOrder,
      this.chefBalance,
      this.profile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(message, 'ProfileState', 'message');
    BuiltValueNullFieldError.checkNotNull(error, 'ProfileState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'ProfileState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isLoggedOut, 'ProfileState', 'isLoggedOut');
    BuiltValueNullFieldError.checkNotNull(
        profilePagesState, 'ProfileState', 'profilePagesState');
    BuiltValueNullFieldError.checkNotNull(
        orderMealsNotes, 'ProfileState', 'orderMealsNotes');
    BuiltValueNullFieldError.checkNotNull(
        preparedOrder, 'ProfileState', 'preparedOrder');
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
        profilePagesState == other.profilePagesState &&
        orderMealsNotes == other.orderMealsNotes &&
        preparedOrder == other.preparedOrder &&
        chefBalance == other.chefBalance &&
        profile == other.profile;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, message.hashCode), error.hashCode),
                                isLoading.hashCode),
                            isLoggedOut.hashCode),
                        profilePagesState.hashCode),
                    orderMealsNotes.hashCode),
                preparedOrder.hashCode),
            chefBalance.hashCode),
        profile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileState')
          ..add('message', message)
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('isLoggedOut', isLoggedOut)
          ..add('profilePagesState', profilePagesState)
          ..add('orderMealsNotes', orderMealsNotes)
          ..add('preparedOrder', preparedOrder)
          ..add('chefBalance', chefBalance)
          ..add('profile', profile))
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

  ProfilePagesState? _profilePagesState;
  ProfilePagesState? get profilePagesState => _$this._profilePagesState;
  set profilePagesState(ProfilePagesState? profilePagesState) =>
      _$this._profilePagesState = profilePagesState;

  ListBuilder<OrderMealNote>? _orderMealsNotes;
  ListBuilder<OrderMealNote> get orderMealsNotes =>
      _$this._orderMealsNotes ??= new ListBuilder<OrderMealNote>();
  set orderMealsNotes(ListBuilder<OrderMealNote>? orderMealsNotes) =>
      _$this._orderMealsNotes = orderMealsNotes;

  ListBuilder<PreparedOrder>? _preparedOrder;
  ListBuilder<PreparedOrder> get preparedOrder =>
      _$this._preparedOrder ??= new ListBuilder<PreparedOrder>();
  set preparedOrder(ListBuilder<PreparedOrder>? preparedOrder) =>
      _$this._preparedOrder = preparedOrder;

  ChefBalance? _chefBalance;
  ChefBalance? get chefBalance => _$this._chefBalance;
  set chefBalance(ChefBalance? chefBalance) =>
      _$this._chefBalance = chefBalance;

  Profile? _profile;
  Profile? get profile => _$this._profile;
  set profile(Profile? profile) => _$this._profile = profile;

  ProfileStateBuilder();

  ProfileStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _error = $v.error;
      _isLoading = $v.isLoading;
      _isLoggedOut = $v.isLoggedOut;
      _profilePagesState = $v.profilePagesState;
      _orderMealsNotes = $v.orderMealsNotes.toBuilder();
      _preparedOrder = $v.preparedOrder.toBuilder();
      _chefBalance = $v.chefBalance;
      _profile = $v.profile;
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
                  message, 'ProfileState', 'message'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, 'ProfileState', 'error'),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, 'ProfileState', 'isLoading'),
              isLoggedOut: BuiltValueNullFieldError.checkNotNull(
                  isLoggedOut, 'ProfileState', 'isLoggedOut'),
              profilePagesState: BuiltValueNullFieldError.checkNotNull(
                  profilePagesState, 'ProfileState', 'profilePagesState'),
              orderMealsNotes: orderMealsNotes.build(),
              preparedOrder: preparedOrder.build(),
              chefBalance: chefBalance,
              profile: profile);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orderMealsNotes';
        orderMealsNotes.build();
        _$failedField = 'preparedOrder';
        preparedOrder.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProfileState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
