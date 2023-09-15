
// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ptf/presentation/utils/converts.dart';

part 'password_entity.freezed.dart';
part 'password_entity.g.dart';

@freezed
class PasswordEntity with _$PasswordEntity {
  const factory PasswordEntity({
    required String id,
    required String website,
    required String username,
    required String password,
    @JsonKey(name: 'category_id')
    required String categoryId,
    @JsonKey(name: 'created_at')
    @TimestampConverter()
    required DateTime createdAt,
    @JsonKey(name: 'updated_at')
    @TimestampConverter()
    required DateTime updatedAt,
  }) = _PasswordEntity;

  factory PasswordEntity.fromJson(Map<String, dynamic> json) => _$PasswordEntityFromJson(json);

}