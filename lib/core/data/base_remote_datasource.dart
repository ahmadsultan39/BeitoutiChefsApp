import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../error/exceptions.dart';
import '../network/models/base_list_response_model.dart';
import '../network/models/base_response_model.dart';
import '../util/constants.dart';

abstract class BaseRemoteDataSource {
  @protected
  Future<List<T>> performGetListRequest<T>(
    String endpoint,
    String token,
  );

  @protected
  Future<T> performGetRequest<T>(
      {required String endpoint,
      required String token,
      required int language,
      int isPaginate = 0});
}

@LazySingleton(as: BaseRemoteDataSource)
class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio dio;

  BaseRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<T>> performGetListRequest<T>(
      String endpoint, String token) async {
    debugPrint('performGetRequest');
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (response.statusCode == 200) {
        final BaseListResponseModel<T> finalResponse =
            BaseListResponseModel<T>.fromJson(json.decode(response.data));
        // if (finalResponse.status!) {
        //   return finalResponse.data!;
        // } else {
        //   debugPrint('e is error');
        //   throw ServerException(error: finalResponse.message ?? "");
        // }
        if (finalResponse.data != null) {
          debugPrint('data is not null');
          return finalResponse.data!;
        } else {
          debugPrint('e is error');
          throw ServerException(error:
          // finalResponse.error
              // ??
              "");
        }
      } else if (response.statusCode == 401) {
        throw ServerException(error: ErrorMessage.ERROR401);
      } else {
        debugPrint('e is error');
        throw ServerException(error: ErrorMessage.ERROR401);
      }
    } catch (e) {
      debugPrint('e is $e');
      if (e is DioError) {
        debugPrint('response code is ${e.response!.statusCode}');
        if (e.response!.statusCode == 401) {
          debugPrint('response code is ${e.response!.statusCode}');
          throw ServerException(error: ErrorMessage.ERROR401);
        } else {
          throw ServerException(error: ErrorMessage.ERROR401);
        }
      } else if (e is ServerException) {
        rethrow;
      }
      throw ServerException();
    }
  }

  @override
  Future<T> performGetRequest<T>({
    required String endpoint,
    required String token,
    int language = 0,
    int isPaginate = 0,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(token,isPagination: isPaginate),
      );
      if (response.statusCode == 200) {
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (finalResponse.data != null) {
          debugPrint('data is not null');
          return finalResponse.data!;
        } else {
          debugPrint('e is error');
          throw ServerException(error: finalResponse.message ?? "");
        }
      } else if (response.statusCode == 401) {
        throw ServerException(error: ErrorMessage.ERROR401);
      } else {
        debugPrint('e is error');
        throw ServerException(error: ErrorMessage.ERROR401);
      }
    } catch (e) {
      debugPrint('e is $e');
      if (e is DioError) {
        debugPrint('response code is ${e.response!.statusCode}');
        if (e.response!.statusCode == 401) {
          debugPrint('response code is ${e.response!.statusCode}');
          throw ServerException(error: ErrorMessage.ERROR401);
        } else {
          throw ServerException(error: ErrorMessage.ERROR401);
        }
      } else if (e is ServerException) {
        rethrow;
      }
      throw ServerException(error: ErrorMessage.ERROR401);
    }
  }
}
