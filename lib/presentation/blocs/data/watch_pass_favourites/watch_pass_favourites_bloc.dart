import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'watch_pass_favourites_event.dart';
part 'watch_pass_favourites_state.dart';
part 'watch_pass_favourites_bloc.freezed.dart';

class WatchPassFavouritesBloc extends Bloc<WatchPassFavouritesEvent, WatchPassFavouritesState> {
  final DataRepository repository;
  WatchPassFavouritesBloc({required this.repository}) : super(const WatchPassFavouritesState.initial()) {
    on<_Watch>((event, emit) {
      try{
        emit(const WatchPassFavouritesState.loading());
        Stream<List<PasswordEntity>> stream = repository.watchFavouritesPasswords();
        emit(WatchPassFavouritesState.streamLoaded(stream: stream));

      } catch(e){
        emit(WatchPassFavouritesState.error(message: e.toString()));
      }
    });
  }
}
