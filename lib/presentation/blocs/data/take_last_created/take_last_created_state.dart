part of 'take_last_created_bloc.dart';

@freezed
class TakeLastCreatedState with _$TakeLastCreatedState {
  const factory TakeLastCreatedState.initial() = _Initial;
  const factory TakeLastCreatedState.loading() = _Loading;
  const factory TakeLastCreatedState.streamLoaded({required Stream<List<PasswordEntity>> stream}) = _StreamLoaded;
  const factory TakeLastCreatedState.error() = _Error;
}
