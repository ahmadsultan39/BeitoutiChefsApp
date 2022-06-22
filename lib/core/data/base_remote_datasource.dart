import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../error/exceptions.dart';
import '../network/models/base_response_model.dart';
import '../util/constants.dart';

abstract class BaseRemoteDataSource {
  // @protected
  // Future<T> performPostRequest<T, E>(
  //   String endpoint,
  //   FormData data,{
  //   Options options,
  // });
  //
  // @protected
  // Future<List<T>> performGetListRequest<T>(
  //   String endpoint,
  //   String token,
  //   String language,
  // );

  @protected
  Future<T> performGetRequest<T>(
    String endpoint,
    String token,
    String language,
  );
}

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio dio;

  BaseRemoteDataSourceImpl({required this.dio});

  // @override
  // Future<List<T>> performGetListRequest<T>(
  //     String endpoint, String token, String language) async {
  //   print('performGetRequest');
  //   try {
  //     final response = await dio.get(
  //       endpoint,
  //       options: GetOptions.getOptionsWithToken(token),
  //     );
  //     if (response.statusCode == 200) {
  //       final BaseListResponseModel<T> finalResponse =
  //           BaseListResponseModel<T>.fromJson(json.decode(response.data));
  //       if (finalResponse.data != null && finalResponse.data!.isNotEmpty) {
  //         print('data is not null');
  //         return finalResponse.data!;
  //       } else {
  //         print('e is error');
  //         throw ServerException();
  //       }
  //     } else if (response.statusCode == 401) {
  //       throw ServerException(error: ErrorMessage.ERROR401);
  //     } else {
  //       print('e is error');
  //       throw ServerException();
  //     }
  //   } catch (e) {
  //     print('e is $e');
  //     if (e is DioError) {
  //       print('response code is ${e.response!.statusCode}');
  //       if (e.response!.statusCode == 401) {
  //         print('response code is ${e.response!.statusCode}');
  //         throw ServerException(error: ErrorCode.ERROR401);
  //       } else {
  //         throw ServerException();
  //       }
  //     } else if (e is ServerException) {
  //       throw ServerException();
  //     }
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<T> performPostRequest<T, E>(
  //   String endpoint,
  //   FormData data, {
  //   required Options options,
  // }) async {
  //   try {
  //     final response = await dio.post(
  //       endpoint,
  //       data: data,
  //       options: options,
  //     );
  //     if (response.statusCode == 200) {
  //       final BaseResponseModel<T> finalResponse = serializers
  //           .deserialize(json.decode(response.data));
  //       if (finalResponse.status) {
  //         return finalResponse.data;
  //       } else {
  //         print('e is error');
  //         throw ServerException();
  //       }
  //     } else if (response.statusCode == 401) {
  //       throw ServerException(error: ErrorCode.ERROR401);
  //     } else {
  //       print('e is error');
  //       throw ServerException();
  //     }
  //   } catch (e) {
  //     print('e is $e');
  //     if (e is DioError) {
  //       if (e.response.statusCode == 401) {
  //         print('response code is ${e.response.statusCode}');
  //         throw ServerException(error: ErrorCode.ERROR401);
  //       } else {
  //         throw ServerException();
  //       }
  //     } else if (e is ServerException) {
  //       throw ServerException();
  //     }
  //     throw ServerException();
  //   }
  // }

  @override
  Future<T> performGetRequest<T>(
      String endpoint, String token, String language) async {
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (response.statusCode == 200) {
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (finalResponse.data != null) {
          print('data is not null');
          return finalResponse.data!;
        } else {
          print('e is error');
          throw ServerException();
        }
      } else if (response.statusCode == 401) {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      } else {
        print('e is error');
        throw ServerException();
      }
    } catch (e) {
      print('e is $e');
      if (e is DioError) {
        print('response code is ${e.response!.statusCode}');
        if (e.response!.statusCode == 401) {
          print('response code is ${e.response!.statusCode}');
          throw ServerException(error: ErrorMessage.someThingWentWrong);
        } else {
          throw ServerException();
        }
      } else if (e is ServerException) {
        throw ServerException();
      }
      throw ServerException();
    }
  }
}
