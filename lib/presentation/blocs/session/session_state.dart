part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.loading() = _Loading;
  const factory SessionState.authenticated() = _Authenticated;
  const factory SessionState.unauthenticated() = _Unauthenticated;
  const factory SessionState.failure(String message) = _Failure;
}
