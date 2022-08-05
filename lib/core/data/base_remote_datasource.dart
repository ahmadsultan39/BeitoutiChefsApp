import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../error/exceptions.dart';
import '../network/models/base_list_response_model.dart';
import '../network/models/base_response_model.dart';
import '../util/constants.dart';

abstract class BaseRemoteDataSource {
  @protected
  Future<T?> performPostRequest<T>({
    required String endpoint,
    required dynamic data,
    required Options options,
  });

  @protected
  Future<T?> performPutRequest<T>({
    required String endpoint,
    required dynamic data,
    required Options options,
  });

  @protected
  Future<List<T>> performGetListRequest<T>({
    required String endpoint,
    required String token,
  });

  @protected
  Future<T> performGetRequest<T>(
    String endpoint,
    String token,
  );

  @protected
  Future<T?> performDeleteRequest<T>({
    required String endpoint,
    required String token,
    dynamic data,
  });
}

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio dio;

  BaseRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<T>> performGetListRequest<T>({
    required String endpoint,
    required String token,
  }) async {
    debugPrint("PerformGetListRequest");
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final BaseListResponseModel<T> finalResponse =
            BaseListResponseModel<T>.fromJson(json.decode(response.data));
        if (finalResponse.data != null ) {
          debugPrint("Data is not null");
          return finalResponse.data!;
        } else {
          debugPrint("Data is null");
          throw NullDataException(error: ErrorMessage.nullData);
        }
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      final String? errorMessage = BaseResponseModel<Null>.fromJson(
        json.decode(
          e.response!.data,
        ),
      ).errors;
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw BadRequestException(
            error: errorMessage ?? ErrorMessage.error400,
          );
        } else if (e.response!.statusCode == 401) {
          throw UnauthorizedException(
            error: errorMessage ?? ErrorMessage.error401,
          );
        } else if (e.response!.statusCode == 403) {
          throw ForbiddenException(
            error: errorMessage ?? ErrorMessage.error403,
          );
        } else if (e.response!.statusCode == 404) {
          throw NotFoundException(
            error: errorMessage ?? ErrorMessage.error404,
          );
        } else if (e.response!.statusCode == 422 ||
                e.response!.statusCode == 412 // TODO fix this habad
            ) {
          throw UnprocessableEntityException(
            error: errorMessage ?? ErrorMessage.error422,
          );
        } else if (e.response!.statusCode == 500) {
          throw InternalServerErrorException(
            error: errorMessage ?? ErrorMessage.error500,
          );
        } else if (e.response!.statusCode == 503) {
          throw ServiceUnavailableException(
            error: errorMessage ?? ErrorMessage.error503,
          );
        } else {
          throw ServerException(
            error: ErrorMessage.someThingWentWrong,
          );
        }
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }

  @override
  Future<T?> performPostRequest<T>({
    required String endpoint,
    required dynamic data,
    required Options options,
    Map<String, dynamic>? queryParameters,
  }) async {
    debugPrint("performPostRequest");
    try {
      final response = await dio.post(
        endpoint,
        options: options,
        data: data,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (T.toString() == "String")
          {
           return json.decode(response.data)["data"];
          }
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(
          json.decode(response.data),
        );
        return finalResponse.data;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final String? errorMessage = BaseResponseModel<Null>.fromJson(
          json.decode(
            e.response!.data,
          ),
        ).errors;
        if (e.response!.statusCode == 400) {
          throw BadRequestException(
            error: errorMessage ?? ErrorMessage.error400,
          );
        } else if (e.response!.statusCode == 401) {
          throw UnauthorizedException(
            error: errorMessage ?? ErrorMessage.error401,
          );
        } else if (e.response!.statusCode == 403) {
          throw ForbiddenException(
            error: errorMessage ?? ErrorMessage.error403,
          );
        } else if (e.response!.statusCode == 404) {
          throw NotFoundException(
            error: errorMessage ?? ErrorMessage.error404,
          );
        } else if (e.response!.statusCode == 422 ||
                e.response!.statusCode == 412 // TODO fix this habad
            ) {
          throw UnprocessableEntityException(
            error: errorMessage ?? ErrorMessage.error422,
          );
        } else if (e.response!.statusCode == 500) {
          throw InternalServerErrorException(
            error: errorMessage ?? ErrorMessage.error500,
          );
        } else if (e.response!.statusCode == 503) {
          throw ServiceUnavailableException(
            error: errorMessage ?? ErrorMessage.error503,
          );
        } else {
          throw ServerException(
            error: ErrorMessage.someThingWentWrong,
          );
        }
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }

  @override
  Future<T> performGetRequest<T>(String endpoint, String token) async {
    debugPrint("PerformGetRequest");
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (T.toString() == "String")
        {
          return json.decode(response.data)["data"];
        }
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (finalResponse.data != null) {
          debugPrint("Data is not null");
          return finalResponse.data!;
        } else {
          debugPrint("Data is null");
          throw NullDataException(error: ErrorMessage.nullData);
        }
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      // TODO fix if response null
      final String? errorMessage = BaseResponseModel<Null>.fromJson(
        json.decode(
          e.response!.data,
        ),
      ).errors;
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw BadRequestException(
            error: errorMessage ?? ErrorMessage.error400,
          );
        } else if (e.response!.statusCode == 401) {
          throw UnauthorizedException(
            error: errorMessage ?? ErrorMessage.error401,
          );
        } else if (e.response!.statusCode == 403) {
          throw ForbiddenException(
            error: errorMessage ?? ErrorMessage.error403,
          );
        } else if (e.response!.statusCode == 404) {
          throw NotFoundException(
            error: errorMessage ?? ErrorMessage.error404,
          );
        } else if (e.response!.statusCode == 422 ||
                e.response!.statusCode == 412 // TODO fix this habad
            ) {
          throw UnprocessableEntityException(
            error: errorMessage ?? ErrorMessage.error422,
          );
        } else if (e.response!.statusCode == 500) {
          throw InternalServerErrorException(
            error: errorMessage ?? ErrorMessage.error500,
          );
        } else if (e.response!.statusCode == 503) {
          throw ServiceUnavailableException(
            error: errorMessage ?? ErrorMessage.error503,
          );
        } else {
          throw ServerException(
            error: ErrorMessage.someThingWentWrong,
          );
        }
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }

  @override
  Future<T?> performPutRequest<T>({
    required String endpoint,
    required Options options,
    data,
  }) async {
    debugPrint("performPutRequest");
    try {
      final response = await dio.put(
        endpoint,
        options: options,
        data: data,
        queryParameters: {
          "_method": "PUT",
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(
          json.decode(response.data),
        );
        return finalResponse.data;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final String? errorMessage = BaseResponseModel<Null>.fromJson(
          json.decode(
            e.response!.data,
          ),
        ).errors;
        if (e.response!.statusCode == 400) {
          throw BadRequestException(
            error: errorMessage ?? ErrorMessage.error400,
          );
        } else if (e.response!.statusCode == 401) {
          throw UnauthorizedException(
            error: errorMessage ?? ErrorMessage.error401,
          );
        } else if (e.response!.statusCode == 403) {
          throw ForbiddenException(
            error: errorMessage ?? ErrorMessage.error403,
          );
        } else if (e.response!.statusCode == 404) {
          throw NotFoundException(
            error: errorMessage ?? ErrorMessage.error404,
          );
        } else if (e.response!.statusCode == 422 ||
                e.response!.statusCode == 412 // TODO fix this habad
            ) {
          throw UnprocessableEntityException(
            error: errorMessage ?? ErrorMessage.error422,
          );
        } else if (e.response!.statusCode == 500) {
          throw InternalServerErrorException(
            error: errorMessage ?? ErrorMessage.error500,
          );
        } else if (e.response!.statusCode == 503) {
          throw ServiceUnavailableException(
            error: errorMessage ?? ErrorMessage.error503,
          );
        } else {
          throw ServerException(
            error: ErrorMessage.someThingWentWrong,
          );
        }
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }

  @override
  Future<T?> performDeleteRequest<T>({
    required String endpoint,
    required String token,
    dynamic data,
  }) async {
    debugPrint("performDeleteRequest");
    try {
      final response = await dio.delete(
        endpoint,
        options: GetOptions.getOptionsWithToken(token),
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(
          json.decode(response.data),
        );
        return finalResponse.data;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final String? errorMessage = BaseResponseModel<Null>.fromJson(
          json.decode(
            e.response!.data,
          ),
        ).errors;
        if (e.response!.statusCode == 400) {
          throw BadRequestException(
            error: errorMessage ?? ErrorMessage.error400,
          );
        } else if (e.response!.statusCode == 401) {
          throw UnauthorizedException(
            error: errorMessage ?? ErrorMessage.error401,
          );
        } else if (e.response!.statusCode == 403) {
          throw ForbiddenException(
            error: errorMessage ?? ErrorMessage.error403,
          );
        } else if (e.response!.statusCode == 404) {
          throw NotFoundException(
            error: errorMessage ?? ErrorMessage.error404,
          );
        } else if (e.response!.statusCode == 422 ||
                e.response!.statusCode == 412 // TODO fix this habad
            ) {
          throw UnprocessableEntityException(
            error: errorMessage ?? ErrorMessage.error422,
          );
        } else if (e.response!.statusCode == 500) {
          throw InternalServerErrorException(
            error: errorMessage ?? ErrorMessage.error500,
          );
        } else if (e.response!.statusCode == 503) {
          throw ServiceUnavailableException(
            error: errorMessage ?? ErrorMessage.error503,
          );
        } else {
          throw ServerException(
            error: ErrorMessage.someThingWentWrong,
          );
        }
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }
}
