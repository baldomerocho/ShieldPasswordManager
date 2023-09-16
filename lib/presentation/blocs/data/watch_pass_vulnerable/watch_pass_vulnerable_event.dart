part of 'watch_pass_vulnerable_bloc.dart';

@freezed
class WatchPassVulnerableEvent with _$WatchPassVulnerableEvent {
  const factory WatchPassVulnerableEvent.started() = _Started;
  const factory WatchPassVulnerableEvent.watch() = _Watch;
}
