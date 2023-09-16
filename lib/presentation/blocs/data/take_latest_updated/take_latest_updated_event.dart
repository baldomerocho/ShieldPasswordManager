part of 'take_latest_updated_bloc.dart';

@freezed
class TakeLatestUpdatedEvent with _$TakeLatestUpdatedEvent {
  const factory TakeLatestUpdatedEvent.started() = _Started;
  const factory TakeLatestUpdatedEvent.watch() = _Watch;
}
