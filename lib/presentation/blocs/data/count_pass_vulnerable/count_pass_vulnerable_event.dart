part of 'count_pass_vulnerable_bloc.dart';

@freezed
class CountPassVulnerableEvent with _$CountPassVulnerableEvent {
  const factory CountPassVulnerableEvent.started() = _Started;
  const factory CountPassVulnerableEvent.count() = _Count;
}
