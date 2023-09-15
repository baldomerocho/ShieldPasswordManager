
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_entity.freezed.dart';
part 'category_entity.g.dart';
@freezed
class CategoryEntity with _$CategoryEntity{
  const factory CategoryEntity({
    required String name,
    String? icon,
    required String id,

  }) = _CategoryEntity;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);
}