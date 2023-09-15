part of 'set_viewed_bloc.dart';

@freezed
class SetViewedEvent with _$SetViewedEvent {
  const factory SetViewedEvent.started() = _Started;
  const factory SetViewedEvent.send(String passID) = _Send;
}
