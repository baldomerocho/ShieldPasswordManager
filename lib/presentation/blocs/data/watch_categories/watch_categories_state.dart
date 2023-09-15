part of 'watch_categories_bloc.dart';

@freezed
class WatchCategoriesState with _$WatchCategoriesState {
  const factory WatchCategoriesState.initial() = _Initial;
  const factory WatchCategoriesState.loading() = _Loading;
  const factory WatchCategoriesState.streamLoaded({
    required Stream<List<CategoryEntity>> stream,
  }) = _StreamLoaded;
  const factory WatchCategoriesState.error({
    required String message,
  }) = _Error;
}
