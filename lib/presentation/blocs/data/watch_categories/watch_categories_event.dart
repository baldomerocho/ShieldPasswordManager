part of 'watch_categories_bloc.dart';

@freezed
class WatchCategoriesEvent with _$WatchCategoriesEvent {
  const factory WatchCategoriesEvent.started() = _Started;
  const factory WatchCategoriesEvent.watch() = _Watch;
}
