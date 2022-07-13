// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prepared_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreparedOrderModel _$PreparedOrderModelFromJson(Map<String, dynamic> json) =>
    PreparedOrderModel(
      id: json['id'] as int,
      type: json['type'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      mealsCost: json['meals_cost'] as int,
      paidToChef: json['paid_to_chef'] as int,
      preparedAt: json['prepared_at'] as String?,
    );

Map<String, dynamic> _$PreparedOrderModelToJson(PreparedOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': _$OrderStatusEnumMap[instance.status],
      'meals_cost': instance.mealsCost,
      'paid_to_chef': instance.paidToChef,
      'prepared_at': instance.preparedAt,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.approved: 'approved',
  OrderStatus.notApproved: 'notApproved',
  OrderStatus.prepared: 'prepared',
  OrderStatus.failedAssigning: 'failedAssigning',
  OrderStatus.picked: 'picked',
  OrderStatus.delivered: 'delivered',
  OrderStatus.notDelivered: 'notDelivered',
  OrderStatus.canceled: 'canceled',
};
