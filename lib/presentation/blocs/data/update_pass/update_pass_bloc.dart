import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'update_pass_event.dart';
part 'update_pass_state.dart';
part 'update_pass_bloc.freezed.dart';

class UpdatePassBloc extends Bloc<UpdatePassEvent, UpdatePassState> {
  final DataRepository repository;
  UpdatePassBloc({required this.repository}) : super(const UpdatePassState.initial()) {
    on<_Send>((event, emit) async {
      try{
        emit(const UpdatePassState.loading());
        PasswordEntity pass = await repository.updatePassword(password: event.password, id: event.id);
        emit(UpdatePassState.success(pass));
      } on Exception catch(_){
        emit(const UpdatePassState.error());
      }
    });
  }
}
