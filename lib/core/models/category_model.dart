import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Category {
  static const String className = "CategoryModel";

  CategoryModel(id,name) : super(id,name);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

}