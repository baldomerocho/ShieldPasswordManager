part of 'save_pass_bloc.dart';

@freezed
class SavePassEvent with _$SavePassEvent {
  const factory SavePassEvent.started() = _Started;
  const factory SavePassEvent.send({required PasswordModel password, String? id}) = _Send;
}
