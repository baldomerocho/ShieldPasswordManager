import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'take_latest_updated_event.dart';
part 'take_latest_updated_state.dart';
part 'take_latest_updated_bloc.freezed.dart';

class TakeLatestUpdatedBloc extends Bloc<TakeLatestUpdatedEvent, TakeLatestUpdatedState> {
  final DataRepository repository;
  TakeLatestUpdatedBloc({required this.repository}) : super(const TakeLatestUpdatedState.initial()) {
    on<_Watch>((event, emit) {
      try{
        emit(const TakeLatestUpdatedState.loading());
        Stream<List<PasswordEntity>> stream = repository.watchLatestUpdatedPasswords();
        emit(TakeLatestUpdatedState.streamLoaded(stream: stream));
      } catch (e) {
        emit(const TakeLatestUpdatedState.error());
      }
    });
  }
}
