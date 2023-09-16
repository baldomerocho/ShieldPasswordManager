import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/entities/password_entity.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'watch_passwords_event.dart';
part 'watch_passwords_state.dart';
part 'watch_passwords_bloc.freezed.dart';

class WatchPasswordsBloc extends Bloc<WatchPasswordsEvent, WatchPasswordsState> {
  final DataRepository repository;
  WatchPasswordsBloc({required this.repository}) : super(const WatchPasswordsState.initial()) {
    on<_WatchPasswords>((event, emit) {
      try{
        emit(const WatchPasswordsState.loading());
        Stream<List<PasswordEntity>> stream = repository.watchPasswords(query: event.query);
        emit(WatchPasswordsState.streamLoaded(stream: stream));
      } catch (e) {
        emit(WatchPasswordsState.error(message: e.toString()));
      }
    });
  }
}
