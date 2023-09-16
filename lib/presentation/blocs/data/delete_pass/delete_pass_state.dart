part of 'delete_pass_bloc.dart';

@freezed
class DeletePassState with _$DeletePassState {
  const factory DeletePassState.initial() = _Initial;
  const factory DeletePassState.loading() = _Loading;
  const factory DeletePassState.success() = _Success;
  const factory DeletePassState.error({required String message}) = _Error;
}
