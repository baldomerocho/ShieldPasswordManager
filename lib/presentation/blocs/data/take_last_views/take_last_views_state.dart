part of 'take_last_views_bloc.dart';

@freezed
class TakeLastViewsState with _$TakeLastViewsState {
  const factory TakeLastViewsState.initial() = _Initial;
  const factory TakeLastViewsState.loading() = _Loading;
  const factory TakeLastViewsState.streamLoaded({required Stream<List<PasswordEntity>> stream}) = _StreamLoaded;
  const factory TakeLastViewsState.error() = _Error;
}
