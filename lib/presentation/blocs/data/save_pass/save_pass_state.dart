part of 'save_pass_bloc.dart';

@freezed
class SavePassState with _$SavePassState {
  const factory SavePassState.initial() = _Initial;
  const factory SavePassState.loading() = _Loading;
  const factory SavePassState.success(PasswordEntity pass) = _Loaded;
  const factory SavePassState.error() = _Error;
}
