import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/entities/category_entity.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'watch_categories_event.dart';
part 'watch_categories_state.dart';
part 'watch_categories_bloc.freezed.dart';

class WatchCategoriesBloc extends Bloc<WatchCategoriesEvent, WatchCategoriesState> {
  final DataRepository repository;
  WatchCategoriesBloc({required this.repository}) : super(const WatchCategoriesState.initial()) {
    on<_Watch>((event, emit)  {
      try{
        emit(const WatchCategoriesState.loading());
        Stream<List<CategoryEntity>> stream = repository.watchCategories();
        emit(WatchCategoriesState.streamLoaded(stream: stream));
      } on Exception catch(_){
        emit(const WatchCategoriesState.error(message: 'Error al cargar las categorias'));
      }
    });
  }
}
