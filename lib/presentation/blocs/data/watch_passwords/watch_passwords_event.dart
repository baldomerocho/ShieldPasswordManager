part of 'watch_passwords_bloc.dart';

@freezed
class WatchPasswordsEvent with _$WatchPasswordsEvent {
  const factory WatchPasswordsEvent.started() = _Started;
  factory WatchPasswordsEvent.watchPasswords(String query) = _WatchPasswords;
  const factory WatchPasswordsEvent.closeStream() = _CloseStream;
}
