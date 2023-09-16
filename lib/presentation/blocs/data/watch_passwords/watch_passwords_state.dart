part of 'watch_passwords_bloc.dart';

@freezed
class WatchPasswordsState with _$WatchPasswordsState {
  const factory WatchPasswordsState.initial() = _Initial;
  const factory WatchPasswordsState.loading() = _Loading;
  const factory WatchPasswordsState.streamLoaded({
    required Stream<List<PasswordEntity>> stream,
  }) = _StreamLoaded;
  const factory WatchPasswordsState.error({required String message,}) = _Error;
}
