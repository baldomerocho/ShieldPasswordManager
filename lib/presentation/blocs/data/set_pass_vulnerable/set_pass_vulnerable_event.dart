part of 'set_pass_vulnerable_bloc.dart';

@freezed
class SetPassVulnerableEvent with _$SetPassVulnerableEvent {
  const factory SetPassVulnerableEvent.started() = _Started;
  const factory SetPassVulnerableEvent.setPassVulnerable({
    required String id, required bool value
  }) = _SetPassVulnerable;
}
