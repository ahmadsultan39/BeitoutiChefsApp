// GENERATED CODE - DO NOT MODIFY BY HAND

part of paginate_response_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginateResponseModel<T> _$PaginateResponseModelFromJson<T extends Equatable>(
        Map<String, dynamic> json) =>
    PaginateResponseModel<T>(
      count: json['total'] as int,
      perPage: json['per_page'] as int,
      numPages: json['last_page'] as int,
      data: (json['data'] as List<dynamic>)
          .map(_Converter<T>().fromJson)
          .toList(),
    );

Map<String, dynamic> _$PaginateResponseModelToJson<T extends Equatable>(
        PaginateResponseModel<T> instance) =>
    <String, dynamic>{
      'total': instance.count,
      'last_page': instance.numPages,
      'per_page': instance.perPage,
      'data': instance.data.map(_Converter<T>().toJson).toList(),
    };
