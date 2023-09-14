// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PasswordEntity _$$_PasswordEntityFromJson(Map<String, dynamic> json) =>
    _$_PasswordEntity(
      id: json['id'] as String,
      website: json['website'] as String,
      favicon: json['favicon'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      category:
          CategoryEntity.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PasswordEntityToJson(_$_PasswordEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'website': instance.website,
      'favicon': instance.favicon,
      'username': instance.username,
      'password': instance.password,
      'category': instance.category,
    };
