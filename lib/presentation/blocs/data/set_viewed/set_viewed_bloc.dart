import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'set_viewed_event.dart';
part 'set_viewed_state.dart';
part 'set_viewed_bloc.freezed.dart';

class SetViewedBloc extends Bloc<SetViewedEvent, SetViewedState> {
  final DataRepository repository;
  SetViewedBloc({required this.repository}) : super(const SetViewedState.initial()) {
    on<_Send>((event, emit) async {
      try{
        emit(const SetViewedState.loading());
        await repository.setViewedPassword(event.passID);
        emit(const SetViewedState.success());
      } catch(e){
        emit(SetViewedState.error(message: e.toString()));
      }
    });
  }
}
