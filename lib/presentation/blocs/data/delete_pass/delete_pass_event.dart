part of 'delete_pass_bloc.dart';

@freezed
class DeletePassEvent with _$DeletePassEvent {
  const factory DeletePassEvent.started() = _Started;
  const factory DeletePassEvent.send({required String id}) = _DeletePass;
}
