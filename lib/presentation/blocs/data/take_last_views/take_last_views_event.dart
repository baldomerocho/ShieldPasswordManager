part of 'take_last_views_bloc.dart';

@freezed
class TakeLastViewsEvent with _$TakeLastViewsEvent {
  const factory TakeLastViewsEvent.started() = _Started;
  const factory TakeLastViewsEvent.watch() = _Watch;
}
