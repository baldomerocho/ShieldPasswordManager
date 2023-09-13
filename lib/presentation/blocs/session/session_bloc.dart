import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/repositories/authentication_repository.dart';

part 'session_event.dart';
part 'session_state.dart';
part 'session_bloc.freezed.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  bool credential = false;
  final AuthenticationRepository repository;
  SessionBloc({required this.repository}) : super(const SessionState.initial()) {
    on<_LoggedIn>((event, emit) async {
      emit(const SessionState.loading());
      try {
        credential = await repository.hasSession();
        if (credential) {
          emit(const SessionState.success());
        } else {
          emit(const SessionState.failure("unauthenticated"));
        }
      } on Exception catch (e) {
        emit(SessionState.failure("failure:$e"));
      }
    });
  }
}
