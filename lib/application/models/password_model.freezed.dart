// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PasswordModel _$PasswordModelFromJson(Map<String, dynamic> json) {
  return _PasswordModel.fromJson(json);
}

/// @nodoc
mixin _$PasswordModel {
  String get website => throw _privateConstructorUsedError;
  String get favicon => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordModelCopyWith<PasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordModelCopyWith<$Res> {
  factory $PasswordModelCopyWith(
          PasswordModel value, $Res Function(PasswordModel) then) =
      _$PasswordModelCopyWithImpl<$Res, PasswordModel>;
  @useResult
  $Res call(
      {String website,
      String favicon,
      String username,
      String password,
      String categoryId});
}

/// @nodoc
class _$PasswordModelCopyWithImpl<$Res, $Val extends PasswordModel>
    implements $PasswordModelCopyWith<$Res> {
  _$PasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? website = null,
    Object? favicon = null,
    Object? username = null,
    Object? password = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
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
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordModelCopyWith<$Res>
    implements $PasswordModelCopyWith<$Res> {
  factory _$$_PasswordModelCopyWith(
          _$_PasswordModel value, $Res Function(_$_PasswordModel) then) =
      __$$_PasswordModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String website,
      String favicon,
      String username,
      String password,
      String categoryId});
}

/// @nodoc
class __$$_PasswordModelCopyWithImpl<$Res>
    extends _$PasswordModelCopyWithImpl<$Res, _$_PasswordModel>
    implements _$$_PasswordModelCopyWith<$Res> {
  __$$_PasswordModelCopyWithImpl(
      _$_PasswordModel _value, $Res Function(_$_PasswordModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? website = null,
    Object? favicon = null,
    Object? username = null,
    Object? password = null,
    Object? categoryId = null,
  }) {
    return _then(_$_PasswordModel(
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
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PasswordModel with DiagnosticableTreeMixin implements _PasswordModel {
  const _$_PasswordModel(
      {required this.website,
      required this.favicon,
      required this.username,
      required this.password,
      required this.categoryId});

  factory _$_PasswordModel.fromJson(Map<String, dynamic> json) =>
      _$$_PasswordModelFromJson(json);

  @override
  final String website;
  @override
  final String favicon;
  @override
  final String username;
  @override
  final String password;
  @override
  final String categoryId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PasswordModel(website: $website, favicon: $favicon, username: $username, password: $password, categoryId: $categoryId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PasswordModel'))
      ..add(DiagnosticsProperty('website', website))
      ..add(DiagnosticsProperty('favicon', favicon))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('categoryId', categoryId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordModel &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.favicon, favicon) || other.favicon == favicon) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, website, favicon, username, password, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordModelCopyWith<_$_PasswordModel> get copyWith =>
      __$$_PasswordModelCopyWithImpl<_$_PasswordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PasswordModelToJson(
      this,
    );
  }
}

abstract class _PasswordModel implements PasswordModel {
  const factory _PasswordModel(
      {required final String website,
      required final String favicon,
      required final String username,
      required final String password,
      required final String categoryId}) = _$_PasswordModel;

  factory _PasswordModel.fromJson(Map<String, dynamic> json) =
      _$_PasswordModel.fromJson;

  @override
  String get website;
  @override
  String get favicon;
  @override
  String get username;
  @override
  String get password;
  @override
  String get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordModelCopyWith<_$_PasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}
