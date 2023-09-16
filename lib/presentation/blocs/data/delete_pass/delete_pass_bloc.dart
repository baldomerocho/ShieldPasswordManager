import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'delete_pass_event.dart';
part 'delete_pass_state.dart';
part 'delete_pass_bloc.freezed.dart';

class DeletePassBloc extends Bloc<DeletePassEvent, DeletePassState> {
  final DataRepository repository;
  DeletePassBloc({required this.repository}) : super(const DeletePassState.initial()) {
    on<_DeletePass>((event, emit) async {
      emit(const DeletePassState.loading());
      try{
        await repository.deletePassword(event.id).then((value) {
          emit(const DeletePassState.success());
        });
      } on Exception catch(e){
        emit(DeletePassState.error(message: e.toString()));
      }
    });
  }
}
