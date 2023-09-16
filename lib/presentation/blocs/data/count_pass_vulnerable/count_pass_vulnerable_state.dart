part of 'count_pass_vulnerable_bloc.dart';

@freezed
class CountPassVulnerableState with _$CountPassVulnerableState {
  const factory CountPassVulnerableState.initial() = _Initial;
  const factory CountPassVulnerableState.loading() = _Loading;
  const factory CountPassVulnerableState.loaded({required int count}) = _Loaded;
  const factory CountPassVulnerableState.error() = _Error;
}
