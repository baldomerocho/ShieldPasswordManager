part of 'take_last_created_bloc.dart';

@freezed
class TakeLastCreatedEvent with _$TakeLastCreatedEvent {
  const factory TakeLastCreatedEvent.started() = _Started;
  const factory TakeLastCreatedEvent.watch() = _Watch;
}
