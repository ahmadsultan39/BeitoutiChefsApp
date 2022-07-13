// GENERATED CODE - DO NOT MODIFY BY HAND

part of base_list_response_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponseModel<T> _$BaseListResponseModelFromJson<T>(
        Map<String, dynamic> json) =>
    BaseListResponseModel<T>(
      error: json['errors'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => _Converter<T>().fromJson(e as Object))
          .toList(),
    );

Map<String, dynamic> _$BaseListResponseModelToJson<T>(
        BaseListResponseModel<T> instance) =>
    <String, dynamic>{
      'errors': instance.error,
      'data': instance.data?.map(_Converter<T>().toJson).toList(),
    };
