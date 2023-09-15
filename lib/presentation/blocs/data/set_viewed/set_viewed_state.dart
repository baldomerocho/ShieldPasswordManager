part of 'set_viewed_bloc.dart';

@freezed
class SetViewedState with _$SetViewedState {
  const factory SetViewedState.initial() = _Initial;
  const factory SetViewedState.loading() = _Loading;
  const factory SetViewedState.success() = _Success;
  const factory SetViewedState.error({required String message}) = _Error;
}
