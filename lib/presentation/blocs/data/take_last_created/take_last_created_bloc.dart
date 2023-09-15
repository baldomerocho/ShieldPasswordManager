import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'take_last_created_event.dart';
part 'take_last_created_state.dart';
part 'take_last_created_bloc.freezed.dart';

class TakeLastCreatedBloc extends Bloc<TakeLastCreatedEvent, TakeLastCreatedState> {
  final DataRepository repository;
  TakeLastCreatedBloc({required this.repository}) : super(const TakeLastCreatedState.initial()) {
    on<_Watch>((event, emit) {
      try{
        emit(const TakeLastCreatedState.loading());
        Stream<List<PasswordEntity>> stream = repository.watchLastCreatedPasswords();
        emit(TakeLastCreatedState.streamLoaded(stream: stream));
      } catch (e) {
        emit(const TakeLastCreatedState.error());
      }
    });
  }
}
