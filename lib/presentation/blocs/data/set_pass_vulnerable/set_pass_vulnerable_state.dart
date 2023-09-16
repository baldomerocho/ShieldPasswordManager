part of 'set_pass_vulnerable_bloc.dart';

@freezed
class SetPassVulnerableState with _$SetPassVulnerableState {
  const factory SetPassVulnerableState.initial() = _Initial;
  const factory SetPassVulnerableState.loading() = _Loading;
  const factory SetPassVulnerableState.loaded() = _Loaded;
  const factory SetPassVulnerableState.error() = _Error;
}
