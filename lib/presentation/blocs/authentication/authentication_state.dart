part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  const factory AuthenticationState.loading() = _Loading;
  const factory AuthenticationState.success() = _Success;
  const factory AuthenticationState.failure(String message) = _Failure;
  const factory AuthenticationState.canceled() = _Canceled;
}
