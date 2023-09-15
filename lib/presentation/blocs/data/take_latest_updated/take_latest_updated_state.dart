part of 'take_latest_updated_bloc.dart';

@freezed
class TakeLatestUpdatedState with _$TakeLatestUpdatedState {
  const factory TakeLatestUpdatedState.initial() = _Initial;
  const factory TakeLatestUpdatedState.loading() = _Loading;
  const factory TakeLatestUpdatedState.streamLoaded({required Stream<List<PasswordEntity>> stream}) = _StreamLoaded;
  const factory TakeLatestUpdatedState.error() = _Error;
}
