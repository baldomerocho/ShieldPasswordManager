import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';
import 'package:ptf/infrastructure/datasources/firebase_firestore.dart';

part 'save_pass_event.dart';
part 'save_pass_state.dart';
part 'save_pass_bloc.freezed.dart';

class SavePassBloc extends Bloc<SavePassEvent, SavePassState> {
  final DataRepository repository;
  SavePassBloc({required this.repository}) : super(const SavePassState.initial()) {
    on<_Send>((event, emit) async {
      try{
        emit(const SavePassState.loading());
        PasswordEntity pass = await repository.createPassword(event.password);
        emit(SavePassState.success(pass));
      } on Exception catch(_){
        emit(const SavePassState.error());
      }
    });
  }
}
