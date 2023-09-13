part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.started() = _Started;
  const factory AuthenticationEvent.newLoginEvent(AuthenticationProvider provider, {EmailPassword? credentials}) = _NewLoginEvent;
  const factory AuthenticationEvent.newLogoutEvent() = _NewLogoutEvent;
  const factory AuthenticationEvent.newDeleteUserEvent() = _NewDeleteUserEvent;
}

class EmailPassword{
  final String email;
  final String password;
  EmailPassword({required this.email, required this.password});
}