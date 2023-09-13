import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_event.dart';
part 'session_state.dart';
part 'session_bloc.freezed.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(const SessionState.initial()) {
    on<_LoggedIn>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(const SessionState.loading());
      await Future.delayed(const Duration(seconds: 3));
      emit(const SessionState.success());
      await Future.delayed(const Duration(seconds: 10));
      emit(const SessionState.failure("Session expired"));
    });
  }
}
