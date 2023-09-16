import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'take_last_views_event.dart';
part 'take_last_views_state.dart';
part 'take_last_views_bloc.freezed.dart';

class TakeLastViewsBloc extends Bloc<TakeLastViewsEvent, TakeLastViewsState> {
  final DataRepository repository;
  TakeLastViewsBloc({required this.repository}) : super(const TakeLastViewsState.initial()) {
    on<_Watch>((event, emit) {
      try{
        emit(const TakeLastViewsState.loading());
        Stream<List<PasswordEntity>> stream = repository.watchRecentViewedPasswords();
        emit(TakeLastViewsState.streamLoaded(stream: stream));
      } catch (e) {
        emit(const TakeLastViewsState.error());
      }
    });
  }
}
