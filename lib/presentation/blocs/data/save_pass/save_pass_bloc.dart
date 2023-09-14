import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/infrastructure/datasources/firebase_firestore.dart';

part 'save_pass_event.dart';
part 'save_pass_state.dart';
part 'save_pass_bloc.freezed.dart';

class SavePassBloc extends Bloc<SavePassEvent, SavePassState> {
  Firestore database;
  SavePassBloc({required this.database}) : super(const SavePassState.initial()) {
    on<_Send>((event, emit) async {
      try{
        emit(const SavePassState.loading());
        await Future.delayed(const Duration(seconds: 2));
        await database.createPassword(password: event.password);
        emit(const SavePassState.success());
      } on Exception catch(_){
        emit(const SavePassState.error());
      }
    });
  }
}
