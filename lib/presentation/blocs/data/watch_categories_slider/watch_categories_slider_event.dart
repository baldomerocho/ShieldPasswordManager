part of 'watch_categories_slider_bloc.dart';

@freezed
class WatchCategoriesSliderEvent with _$WatchCategoriesSliderEvent {
  const factory WatchCategoriesSliderEvent.started() = _Started;
  const factory WatchCategoriesSliderEvent.watch() = _Watch;
}
