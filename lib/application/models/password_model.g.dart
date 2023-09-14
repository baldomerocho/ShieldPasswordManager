// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PasswordModel _$$_PasswordModelFromJson(Map<String, dynamic> json) =>
    _$_PasswordModel(
      website: json['website'] as String,
      favicon: json['favicon'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$$_PasswordModelToJson(_$_PasswordModel instance) =>
    <String, dynamic>{
      'website': instance.website,
      'favicon': instance.favicon,
      'username': instance.username,
      'password': instance.password,
      'categoryId': instance.categoryId,
    };
