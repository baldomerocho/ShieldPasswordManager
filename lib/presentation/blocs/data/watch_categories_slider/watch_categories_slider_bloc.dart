import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'watch_categories_slider_event.dart';
part 'watch_categories_slider_state.dart';
part 'watch_categories_slider_bloc.freezed.dart';

class WatchCategoriesSliderBloc extends Bloc<WatchCategoriesSliderEvent, WatchCategoriesSliderState> {
  final DataRepository repository;
  WatchCategoriesSliderBloc({required this.repository}) : super(const WatchCategoriesSliderState.initial()) {
    on<_Watch>((event, emit) {
      try{
        emit(const WatchCategoriesSliderState.loading());
        Stream<List<CategoryEntity>> stream = repository.watchCategories();
        emit(WatchCategoriesSliderState.streamLoaded(stream: stream));
      } catch(e){
        emit(WatchCategoriesSliderState.error(message: e.toString()));
      }
    });
  }
}
