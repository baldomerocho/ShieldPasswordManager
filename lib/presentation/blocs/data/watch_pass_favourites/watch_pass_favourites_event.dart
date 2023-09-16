part of 'watch_pass_favourites_bloc.dart';

@freezed
class WatchPassFavouritesEvent with _$WatchPassFavouritesEvent {
  const factory WatchPassFavouritesEvent.started() = _Started;
  factory WatchPassFavouritesEvent.watch() = _Watch;
  factory WatchPassFavouritesEvent.unwatch() = _Unwatch;
}
