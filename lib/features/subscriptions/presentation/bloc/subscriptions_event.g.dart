// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetSubscriptionsEvent extends GetSubscriptionsEvent {
  factory _$GetSubscriptionsEvent(
          [void Function(GetSubscriptionsEventBuilder)? updates]) =>
      (new GetSubscriptionsEventBuilder()..update(updates))._build();

  _$GetSubscriptionsEvent._() : super._();

  @override
  GetSubscriptionsEvent rebuild(
          void Function(GetSubscriptionsEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSubscriptionsEventBuilder toBuilder() =>
      new GetSubscriptionsEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSubscriptionsEvent;
  }

  @override
  int get hashCode {
    return 1073070365;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetSubscriptionsEvent').toString();
  }
}

class GetSubscriptionsEventBuilder
    implements Builder<GetSubscriptionsEvent, GetSubscriptionsEventBuilder> {
  _$GetSubscriptionsEvent? _$v;

  GetSubscriptionsEventBuilder();

  @override
  void replace(GetSubscriptionsEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetSubscriptionsEvent;
  }

  @override
  void update(void Function(GetSubscriptionsEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetSubscriptionsEvent build() => _build();

  _$GetSubscriptionsEvent _build() {
    final _$result = _$v ?? new _$GetSubscriptionsEvent._();
    replace(_$result);
    return _$result;
  }
}

class _$GetChefMealsEvent extends GetChefMealsEvent {
  factory _$GetChefMealsEvent(
          [void Function(GetChefMealsEventBuilder)? updates]) =>
      (new GetChefMealsEventBuilder()..update(updates))._build();

  _$GetChefMealsEvent._() : super._();

  @override
  GetChefMealsEvent rebuild(void Function(GetChefMealsEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetChefMealsEventBuilder toBuilder() =>
      new GetChefMealsEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetChefMealsEvent;
  }

  @override
  int get hashCode {
    return 699054476;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetChefMealsEvent').toString();
  }
}

class GetChefMealsEventBuilder
    implements Builder<GetChefMealsEvent, GetChefMealsEventBuilder> {
  _$GetChefMealsEvent? _$v;

  GetChefMealsEventBuilder();

  @override
  void replace(GetChefMealsEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetChefMealsEvent;
  }

  @override
  void update(void Function(GetChefMealsEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetChefMealsEvent build() => _build();

  _$GetChefMealsEvent _build() {
    final _$result = _$v ?? new _$GetChefMealsEvent._();
    replace(_$result);
    return _$result;
  }
}

class _$DeleteSubscriptionEvent extends DeleteSubscriptionEvent {
  @override
  final int id;

  factory _$DeleteSubscriptionEvent(
          [void Function(DeleteSubscriptionEventBuilder)? updates]) =>
      (new DeleteSubscriptionEventBuilder()..update(updates))._build();

  _$DeleteSubscriptionEvent._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DeleteSubscriptionEvent', 'id');
  }

  @override
  DeleteSubscriptionEvent rebuild(
          void Function(DeleteSubscriptionEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteSubscriptionEventBuilder toBuilder() =>
      new DeleteSubscriptionEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteSubscriptionEvent && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteSubscriptionEvent')
          ..add('id', id))
        .toString();
  }
}

class DeleteSubscriptionEventBuilder
    implements
        Builder<DeleteSubscriptionEvent, DeleteSubscriptionEventBuilder> {
  _$DeleteSubscriptionEvent? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DeleteSubscriptionEventBuilder();

  DeleteSubscriptionEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteSubscriptionEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteSubscriptionEvent;
  }

  @override
  void update(void Function(DeleteSubscriptionEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteSubscriptionEvent build() => _build();

  _$DeleteSubscriptionEvent _build() {
    final _$result = _$v ??
        new _$DeleteSubscriptionEvent._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DeleteSubscriptionEvent', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$EditSubscriptionAvailabilityEvent
    extends EditSubscriptionAvailabilityEvent {
  @override
  final int id;

  factory _$EditSubscriptionAvailabilityEvent(
          [void Function(EditSubscriptionAvailabilityEventBuilder)? updates]) =>
      (new EditSubscriptionAvailabilityEventBuilder()..update(updates))
          ._build();

  _$EditSubscriptionAvailabilityEvent._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'EditSubscriptionAvailabilityEvent', 'id');
  }

  @override
  EditSubscriptionAvailabilityEvent rebuild(
          void Function(EditSubscriptionAvailabilityEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditSubscriptionAvailabilityEventBuilder toBuilder() =>
      new EditSubscriptionAvailabilityEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditSubscriptionAvailabilityEvent && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditSubscriptionAvailabilityEvent')
          ..add('id', id))
        .toString();
  }
}

class EditSubscriptionAvailabilityEventBuilder
    implements
        Builder<EditSubscriptionAvailabilityEvent,
            EditSubscriptionAvailabilityEventBuilder> {
  _$EditSubscriptionAvailabilityEvent? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  EditSubscriptionAvailabilityEventBuilder();

  EditSubscriptionAvailabilityEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditSubscriptionAvailabilityEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditSubscriptionAvailabilityEvent;
  }

  @override
  void update(
      void Function(EditSubscriptionAvailabilityEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditSubscriptionAvailabilityEvent build() => _build();

  _$EditSubscriptionAvailabilityEvent _build() {
    final _$result = _$v ??
        new _$EditSubscriptionAvailabilityEvent._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'EditSubscriptionAvailabilityEvent', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$AddSubscriptionEvent extends AddSubscriptionEvent {
  @override
  final ParamsAddNewSubscriptionUseCase params;

  factory _$AddSubscriptionEvent(
          [void Function(AddSubscriptionEventBuilder)? updates]) =>
      (new AddSubscriptionEventBuilder()..update(updates))._build();

  _$AddSubscriptionEvent._({required this.params}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        params, r'AddSubscriptionEvent', 'params');
  }

  @override
  AddSubscriptionEvent rebuild(
          void Function(AddSubscriptionEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddSubscriptionEventBuilder toBuilder() =>
      new AddSubscriptionEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddSubscriptionEvent && params == other.params;
  }

  @override
  int get hashCode {
    return $jf($jc(0, params.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddSubscriptionEvent')
          ..add('params', params))
        .toString();
  }
}

class AddSubscriptionEventBuilder
    implements Builder<AddSubscriptionEvent, AddSubscriptionEventBuilder> {
  _$AddSubscriptionEvent? _$v;

  ParamsAddNewSubscriptionUseCase? _params;
  ParamsAddNewSubscriptionUseCase? get params => _$this._params;
  set params(ParamsAddNewSubscriptionUseCase? params) =>
      _$this._params = params;

  AddSubscriptionEventBuilder();

  AddSubscriptionEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _params = $v.params;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddSubscriptionEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddSubscriptionEvent;
  }

  @override
  void update(void Function(AddSubscriptionEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddSubscriptionEvent build() => _build();

  _$AddSubscriptionEvent _build() {
    final _$result = _$v ??
        new _$AddSubscriptionEvent._(
            params: BuiltValueNullFieldError.checkNotNull(
                params, r'AddSubscriptionEvent', 'params'));
    replace(_$result);
    return _$result;
  }
}

class _$EditSubscriptionEvent extends EditSubscriptionEvent {
  @override
  final ParamsEditSubscriptionUseCase params;

  factory _$EditSubscriptionEvent(
          [void Function(EditSubscriptionEventBuilder)? updates]) =>
      (new EditSubscriptionEventBuilder()..update(updates))._build();

  _$EditSubscriptionEvent._({required this.params}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        params, r'EditSubscriptionEvent', 'params');
  }

  @override
  EditSubscriptionEvent rebuild(
          void Function(EditSubscriptionEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditSubscriptionEventBuilder toBuilder() =>
      new EditSubscriptionEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditSubscriptionEvent && params == other.params;
  }

  @override
  int get hashCode {
    return $jf($jc(0, params.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditSubscriptionEvent')
          ..add('params', params))
        .toString();
  }
}

class EditSubscriptionEventBuilder
    implements Builder<EditSubscriptionEvent, EditSubscriptionEventBuilder> {
  _$EditSubscriptionEvent? _$v;

  ParamsEditSubscriptionUseCase? _params;
  ParamsEditSubscriptionUseCase? get params => _$this._params;
  set params(ParamsEditSubscriptionUseCase? params) => _$this._params = params;

  EditSubscriptionEventBuilder();

  EditSubscriptionEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _params = $v.params;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditSubscriptionEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditSubscriptionEvent;
  }

  @override
  void update(void Function(EditSubscriptionEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditSubscriptionEvent build() => _build();

  _$EditSubscriptionEvent _build() {
    final _$result = _$v ??
        new _$EditSubscriptionEvent._(
            params: BuiltValueNullFieldError.checkNotNull(
                params, r'EditSubscriptionEvent', 'params'));
    replace(_$result);
    return _$result;
  }
}

class _$ClearMessage extends ClearMessage {
  factory _$ClearMessage([void Function(ClearMessageBuilder)? updates]) =>
      (new ClearMessageBuilder()..update(updates))._build();

  _$ClearMessage._() : super._();

  @override
  ClearMessage rebuild(void Function(ClearMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearMessageBuilder toBuilder() => new ClearMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearMessage;
  }

  @override
  int get hashCode {
    return 147402354;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearMessage').toString();
  }
}

class ClearMessageBuilder
    implements Builder<ClearMessage, ClearMessageBuilder> {
  _$ClearMessage? _$v;

  ClearMessageBuilder();

  @override
  void replace(ClearMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearMessage;
  }

  @override
  void update(void Function(ClearMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearMessage build() => _build();

  _$ClearMessage _build() {
    final _$result = _$v ?? new _$ClearMessage._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
