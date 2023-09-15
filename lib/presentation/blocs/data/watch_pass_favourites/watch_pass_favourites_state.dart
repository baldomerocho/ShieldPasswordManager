part of 'watch_pass_favourites_bloc.dart';

@freezed
class WatchPassFavouritesState with _$WatchPassFavouritesState {
  const factory WatchPassFavouritesState.initial() = _Initial;
  const factory WatchPassFavouritesState.loading() = _Loading;
  const factory WatchPassFavouritesState.streamLoaded({
    required Stream<List<PasswordEntity>> stream,
  }) = _StreamLoaded;
  const factory WatchPassFavouritesState.error({
    required String message,
  }) = _Error;
}
