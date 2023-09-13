// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)
        newLoginEvent,
    required TResult Function() newLogoutEvent,
    required TResult Function() newDeleteUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult? Function()? newLogoutEvent,
    TResult? Function()? newDeleteUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult Function()? newLogoutEvent,
    TResult Function()? newDeleteUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NewLoginEvent value) newLoginEvent,
    required TResult Function(_NewLogoutEvent value) newLogoutEvent,
    required TResult Function(_NewDeleteUserEvent value) newDeleteUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NewLoginEvent value)? newLoginEvent,
    TResult? Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult? Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NewLoginEvent value)? newLoginEvent,
    TResult Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AuthenticationEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)
        newLoginEvent,
    required TResult Function() newLogoutEvent,
    required TResult Function() newDeleteUserEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult? Function()? newLogoutEvent,
    TResult? Function()? newDeleteUserEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult Function()? newLogoutEvent,
    TResult Function()? newDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NewLoginEvent value) newLoginEvent,
    required TResult Function(_NewLogoutEvent value) newLogoutEvent,
    required TResult Function(_NewDeleteUserEvent value) newDeleteUserEvent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NewLoginEvent value)? newLoginEvent,
    TResult? Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult? Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NewLoginEvent value)? newLoginEvent,
    TResult Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AuthenticationEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_NewLoginEventCopyWith<$Res> {
  factory _$$_NewLoginEventCopyWith(
          _$_NewLoginEvent value, $Res Function(_$_NewLoginEvent) then) =
      __$$_NewLoginEventCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthenticationProvider provider, EmailPassword? credentials});
}

/// @nodoc
class __$$_NewLoginEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_NewLoginEvent>
    implements _$$_NewLoginEventCopyWith<$Res> {
  __$$_NewLoginEventCopyWithImpl(
      _$_NewLoginEvent _value, $Res Function(_$_NewLoginEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? credentials = freezed,
  }) {
    return _then(_$_NewLoginEvent(
      null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as AuthenticationProvider,
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as EmailPassword?,
    ));
  }
}

/// @nodoc

class _$_NewLoginEvent implements _NewLoginEvent {
  const _$_NewLoginEvent(this.provider, {this.credentials});

  @override
  final AuthenticationProvider provider;
  @override
  final EmailPassword? credentials;

  @override
  String toString() {
    return 'AuthenticationEvent.newLoginEvent(provider: $provider, credentials: $credentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewLoginEvent &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.credentials, credentials) ||
                other.credentials == credentials));
  }

  @override
  int get hashCode => Object.hash(runtimeType, provider, credentials);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewLoginEventCopyWith<_$_NewLoginEvent> get copyWith =>
      __$$_NewLoginEventCopyWithImpl<_$_NewLoginEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)
        newLoginEvent,
    required TResult Function() newLogoutEvent,
    required TResult Function() newDeleteUserEvent,
  }) {
    return newLoginEvent(provider, credentials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult? Function()? newLogoutEvent,
    TResult? Function()? newDeleteUserEvent,
  }) {
    return newLoginEvent?.call(provider, credentials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult Function()? newLogoutEvent,
    TResult Function()? newDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (newLoginEvent != null) {
      return newLoginEvent(provider, credentials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NewLoginEvent value) newLoginEvent,
    required TResult Function(_NewLogoutEvent value) newLogoutEvent,
    required TResult Function(_NewDeleteUserEvent value) newDeleteUserEvent,
  }) {
    return newLoginEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NewLoginEvent value)? newLoginEvent,
    TResult? Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult? Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
  }) {
    return newLoginEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NewLoginEvent value)? newLoginEvent,
    TResult Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (newLoginEvent != null) {
      return newLoginEvent(this);
    }
    return orElse();
  }
}

abstract class _NewLoginEvent implements AuthenticationEvent {
  const factory _NewLoginEvent(final AuthenticationProvider provider,
      {final EmailPassword? credentials}) = _$_NewLoginEvent;

  AuthenticationProvider get provider;
  EmailPassword? get credentials;
  @JsonKey(ignore: true)
  _$$_NewLoginEventCopyWith<_$_NewLoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NewLogoutEventCopyWith<$Res> {
  factory _$$_NewLogoutEventCopyWith(
          _$_NewLogoutEvent value, $Res Function(_$_NewLogoutEvent) then) =
      __$$_NewLogoutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NewLogoutEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_NewLogoutEvent>
    implements _$$_NewLogoutEventCopyWith<$Res> {
  __$$_NewLogoutEventCopyWithImpl(
      _$_NewLogoutEvent _value, $Res Function(_$_NewLogoutEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NewLogoutEvent implements _NewLogoutEvent {
  const _$_NewLogoutEvent();

  @override
  String toString() {
    return 'AuthenticationEvent.newLogoutEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NewLogoutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)
        newLoginEvent,
    required TResult Function() newLogoutEvent,
    required TResult Function() newDeleteUserEvent,
  }) {
    return newLogoutEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult? Function()? newLogoutEvent,
    TResult? Function()? newDeleteUserEvent,
  }) {
    return newLogoutEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult Function()? newLogoutEvent,
    TResult Function()? newDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (newLogoutEvent != null) {
      return newLogoutEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NewLoginEvent value) newLoginEvent,
    required TResult Function(_NewLogoutEvent value) newLogoutEvent,
    required TResult Function(_NewDeleteUserEvent value) newDeleteUserEvent,
  }) {
    return newLogoutEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NewLoginEvent value)? newLoginEvent,
    TResult? Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult? Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
  }) {
    return newLogoutEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NewLoginEvent value)? newLoginEvent,
    TResult Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (newLogoutEvent != null) {
      return newLogoutEvent(this);
    }
    return orElse();
  }
}

abstract class _NewLogoutEvent implements AuthenticationEvent {
  const factory _NewLogoutEvent() = _$_NewLogoutEvent;
}

/// @nodoc
abstract class _$$_NewDeleteUserEventCopyWith<$Res> {
  factory _$$_NewDeleteUserEventCopyWith(_$_NewDeleteUserEvent value,
          $Res Function(_$_NewDeleteUserEvent) then) =
      __$$_NewDeleteUserEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NewDeleteUserEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_NewDeleteUserEvent>
    implements _$$_NewDeleteUserEventCopyWith<$Res> {
  __$$_NewDeleteUserEventCopyWithImpl(
      _$_NewDeleteUserEvent _value, $Res Function(_$_NewDeleteUserEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NewDeleteUserEvent implements _NewDeleteUserEvent {
  const _$_NewDeleteUserEvent();

  @override
  String toString() {
    return 'AuthenticationEvent.newDeleteUserEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NewDeleteUserEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)
        newLoginEvent,
    required TResult Function() newLogoutEvent,
    required TResult Function() newDeleteUserEvent,
  }) {
    return newDeleteUserEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult? Function()? newLogoutEvent,
    TResult? Function()? newDeleteUserEvent,
  }) {
    return newDeleteUserEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            AuthenticationProvider provider, EmailPassword? credentials)?
        newLoginEvent,
    TResult Function()? newLogoutEvent,
    TResult Function()? newDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (newDeleteUserEvent != null) {
      return newDeleteUserEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NewLoginEvent value) newLoginEvent,
    required TResult Function(_NewLogoutEvent value) newLogoutEvent,
    required TResult Function(_NewDeleteUserEvent value) newDeleteUserEvent,
  }) {
    return newDeleteUserEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NewLoginEvent value)? newLoginEvent,
    TResult? Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult? Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
  }) {
    return newDeleteUserEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NewLoginEvent value)? newLoginEvent,
    TResult Function(_NewLogoutEvent value)? newLogoutEvent,
    TResult Function(_NewDeleteUserEvent value)? newDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (newDeleteUserEvent != null) {
      return newDeleteUserEvent(this);
    }
    return orElse();
  }
}

abstract class _NewDeleteUserEvent implements AuthenticationEvent {
  const factory _NewDeleteUserEvent() = _$_NewDeleteUserEvent;
}

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
    required TResult Function() canceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
    TResult? Function()? canceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    TResult Function()? canceled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Canceled value) canceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Canceled value)? canceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AuthenticationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
    required TResult Function() canceled,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
    TResult? Function()? canceled,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Canceled value) canceled,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AuthenticationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
    required TResult Function() canceled,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
    TResult? Function()? canceled,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Canceled value) canceled,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthenticationState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success();

  @override
  String toString() {
    return 'AuthenticationState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
    required TResult Function() canceled,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
    TResult? Function()? canceled,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Canceled value) canceled,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AuthenticationState {
  const factory _Success() = _$_Success;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Failure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
    required TResult Function() canceled,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
    TResult? Function()? canceled,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Canceled value) canceled,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AuthenticationState {
  const factory _Failure(final String message) = _$_Failure;

  String get message;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CanceledCopyWith<$Res> {
  factory _$$_CanceledCopyWith(
          _$_Canceled value, $Res Function(_$_Canceled) then) =
      __$$_CanceledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CanceledCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Canceled>
    implements _$$_CanceledCopyWith<$Res> {
  __$$_CanceledCopyWithImpl(
      _$_Canceled _value, $Res Function(_$_Canceled) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Canceled implements _Canceled {
  const _$_Canceled();

  @override
  String toString() {
    return 'AuthenticationState.canceled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Canceled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
    required TResult Function() canceled,
  }) {
    return canceled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
    TResult? Function()? canceled,
  }) {
    return canceled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Canceled value) canceled,
  }) {
    return canceled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return canceled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled(this);
    }
    return orElse();
  }
}

abstract class _Canceled implements AuthenticationState {
  const factory _Canceled() = _$_Canceled;
}
