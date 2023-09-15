part of 'update_pass_bloc.dart';

@freezed
class UpdatePassState with _$UpdatePassState {
  const factory UpdatePassState.initial() = _Initial;
  const factory UpdatePassState.loading() = _Loading;
  const factory UpdatePassState.success(PasswordEntity pass) = _Success;
  const factory UpdatePassState.error() = _Error;
}
