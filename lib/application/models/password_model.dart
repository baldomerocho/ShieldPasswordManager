import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'password_model.freezed.dart';
part 'password_model.g.dart';

@freezed
class PasswordModel with _$PasswordModel {
  const factory PasswordModel({
    required String website,
    required String favicon,
    required String username,
    required String password,
    required String categoryId,
  }) = _PasswordModel;

  factory PasswordModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordModelFromJson(json);
}