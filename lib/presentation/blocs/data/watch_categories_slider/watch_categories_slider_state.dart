part of 'watch_categories_slider_bloc.dart';

@freezed
class WatchCategoriesSliderState with _$WatchCategoriesSliderState {
  const factory WatchCategoriesSliderState.initial() = _Initial;
  const factory WatchCategoriesSliderState.loading() = _Loading;
  const factory WatchCategoriesSliderState.streamLoaded({
    required Stream<List<CategoryEntity>> stream,
  }) = _StreamLoaded;
  const factory WatchCategoriesSliderState.error({
    required String message,
  }) = _Error;
}
