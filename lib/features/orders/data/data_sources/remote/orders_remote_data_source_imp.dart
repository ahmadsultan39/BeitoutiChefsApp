
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/base_remote_datasource.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/models/base_list_response_model.dart';
import '../../../../../core/network/models/base_response_model.dart';
import '../../../../../core/util/constants.dart';
import '../../models/orders_times_model.dart';
import '../../models/time_order_model.dart';
import 'orders_remote_data_source.dart';

@LazySingleton(as: OrdersRemoteDataSource)
class OrdersRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements OrdersRemoteDataSource {
  OrdersRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<List<OrdersTimesModel>> getOrdersTimes({required String token})
  => performGetListRequest<OrdersTimesModel>(endpoint: Endpoints.ordersTimes,token: token);
  // async {
  //   final BaseListResponseModel<OrdersTimesModel> finalResponse =
  //   BaseListResponseModel<OrdersTimesModel>.fromJson(json.decode(
  //     '{"data":[{"clock":"2022-06-18 01:00:54","meals":[{"id":10,"chef_id":1,"image":"\/storage\/mealsImages\/kebehM2lieh.jfif","name":"\u0643\u0628\u0629 \u0645\u0642\u0644\u064a\u0629","quantity":1}]},{"clock":"2022-06-06 04:00:00","meals":[{"id":5,"chef_id":1,"image":"\/storage\/mealsImages\/mlokhieh.jpg","name":"\u0645\u0644\u0648\u062e\u064a\u0629","quantity":2}]},{"clock":"2022-06-07 04:00:00","meals":[{"id":7,"chef_id":1,"image":"\/storage\/mealsImages\/shishBarak.jfif","name":"\u0634\u064a\u0634\u0628\u0631\u0643","quantity":1}]},{"clock":"2022-06-08 04:00:00","meals":[{"id":10,"chef_id":1,"image":"\/storage\/mealsImages\/kebehM2lieh.jfif","name":"\u0643\u0628\u0629 \u0645\u0642\u0644\u064a\u0629","quantity":1}]},{"clock":"2022-06-09 04:00:00","meals":[{"id":10,"chef_id":1,"image":"\/storage\/mealsImages\/kebehM2lieh.jfif","name":"\u0643\u0628\u0629 \u0645\u0642\u0644\u064a\u0629","quantity":1}]}]}'
  //   ));
  //     return finalResponse.data!;
  // }

  @override
  Future<List<TimeOrderModel>> getTimeOrders({required String token, required String time})  =>
      performGetListRequest<TimeOrderModel>(endpoint: Endpoints.timeOrders(time.split(" ").last),token: token);

  @override
  Future<void> changeStatus({required String token, required int orderId}) async {
    await performPutRequest<Null>(endpoint:  Endpoints.changeOrderStatus(orderId),
        options: GetOptions.getOptionsWithToken(token));
  }
}
