import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_entity.dart';

part 'password_entity.freezed.dart';
part 'password_entity.g.dart';

@freezed
class PasswordEntity with _$PasswordEntity {
  const factory PasswordEntity({
    required String id,
    required String website,
    required String favicon,
    required String username,
    required String password,
    required CategoryEntity category,
  }) = _PasswordEntity;

  factory PasswordEntity.fromJson(Map<String, dynamic> json) =>
      _$PasswordEntityFromJson(json);
}