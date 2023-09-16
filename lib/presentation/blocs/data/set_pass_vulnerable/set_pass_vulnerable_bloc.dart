import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'set_pass_vulnerable_event.dart';
part 'set_pass_vulnerable_state.dart';
part 'set_pass_vulnerable_bloc.freezed.dart';

class SetPassVulnerableBloc extends Bloc<SetPassVulnerableEvent, SetPassVulnerableState> {
  final DataRepository repository;
  SetPassVulnerableBloc({required this.repository}) : super(const SetPassVulnerableState.initial()) {
    on<_SetPassVulnerable>((event, emit) async {
      emit(const SetPassVulnerableState.loading());
      try {
        await repository.setPassVulnerable(id: event.id, value: event.value);
        emit(const SetPassVulnerableState.loaded());
      } catch (e) {
        emit(SetPassVulnerableState.error());
      }
    });
  }
}
