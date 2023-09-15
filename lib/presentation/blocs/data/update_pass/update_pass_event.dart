part of 'update_pass_bloc.dart';

@freezed
class UpdatePassEvent with _$UpdatePassEvent {
  const factory UpdatePassEvent.started() = _Started;
  const factory UpdatePassEvent.send({
    required PasswordModel password, required String id
  }) = _Send;
}
