// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PasswordEntity _$PasswordEntityFromJson(Map<String, dynamic> json) {
  return _PasswordEntity.fromJson(json);
}

/// @nodoc
mixin _$PasswordEntity {
  String get id => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  String get favicon => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  CategoryEntity get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordEntityCopyWith<PasswordEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordEntityCopyWith<$Res> {
  factory $PasswordEntityCopyWith(
          PasswordEntity value, $Res Function(PasswordEntity) then) =
      _$PasswordEntityCopyWithImpl<$Res, PasswordEntity>;
  @useResult
  $Res call(
      {String id,
      String website,
      String favicon,
      String username,
      String password,
      CategoryEntity category});

  $CategoryEntityCopyWith<$Res> get category;
}

/// @nodoc
class _$PasswordEntityCopyWithImpl<$Res, $Val extends PasswordEntity>
    implements $PasswordEntityCopyWith<$Res> {
  _$PasswordEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? website = null,
    Object? favicon = null,
    Object? username = null,
    Object? password = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      favicon: null == favicon
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryEntityCopyWith<$Res> get category {
    return $CategoryEntityCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PasswordEntityCopyWith<$Res>
    implements $PasswordEntityCopyWith<$Res> {
  factory _$$_PasswordEntityCopyWith(
          _$_PasswordEntity value, $Res Function(_$_PasswordEntity) then) =
      __$$_PasswordEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String website,
      String favicon,
      String username,
      String password,
      CategoryEntity category});

  @override
  $CategoryEntityCopyWith<$Res> get category;
}

/// @nodoc
class __$$_PasswordEntityCopyWithImpl<$Res>
    extends _$PasswordEntityCopyWithImpl<$Res, _$_PasswordEntity>
    implements _$$_PasswordEntityCopyWith<$Res> {
  __$$_PasswordEntityCopyWithImpl(
      _$_PasswordEntity _value, $Res Function(_$_PasswordEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? website = null,
    Object? favicon = null,
    Object? username = null,
    Object? password = null,
    Object? category = null,
  }) {
    return _then(_$_PasswordEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      favicon: null == favicon
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PasswordEntity implements _PasswordEntity {
  const _$_PasswordEntity(
      {required this.id,
      required this.website,
      required this.favicon,
      required this.username,
      required this.password,
      required this.category});

  factory _$_PasswordEntity.fromJson(Map<String, dynamic> json) =>
      _$$_PasswordEntityFromJson(json);

  @override
  final String id;
  @override
  final String website;
  @override
  final String favicon;
  @override
  final String username;
  @override
  final String password;
  @override
  final CategoryEntity category;

  @override
  String toString() {
    return 'PasswordEntity(id: $id, website: $website, favicon: $favicon, username: $username, password: $password, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.favicon, favicon) || other.favicon == favicon) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, website, favicon, username, password, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordEntityCopyWith<_$_PasswordEntity> get copyWith =>
      __$$_PasswordEntityCopyWithImpl<_$_PasswordEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PasswordEntityToJson(
      this,
    );
  }
}

abstract class _PasswordEntity implements PasswordEntity {
  const factory _PasswordEntity(
      {required final String id,
      required final String website,
      required final String favicon,
      required final String username,
      required final String password,
      required final CategoryEntity category}) = _$_PasswordEntity;

  factory _PasswordEntity.fromJson(Map<String, dynamic> json) =
      _$_PasswordEntity.fromJson;

  @override
  String get id;
  @override
  String get website;
  @override
  String get favicon;
  @override
  String get username;
  @override
  String get password;
  @override
  CategoryEntity get category;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordEntityCopyWith<_$_PasswordEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
