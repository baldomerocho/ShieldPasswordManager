part of 'watch_pass_vulnerable_bloc.dart';

@freezed
class WatchPassVulnerableState with _$WatchPassVulnerableState {
  const factory WatchPassVulnerableState.initial() = _Initial;
  const factory WatchPassVulnerableState.loading() = _Loading;
  const factory WatchPassVulnerableState.streamLoaded({
    required Stream<List<PasswordEntity>> stream}) = _StreamLoaded;
  const factory WatchPassVulnerableState.error() = _Loaded;
}
