import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'count_pass_vulnerable_event.dart';
part 'count_pass_vulnerable_state.dart';
part 'count_pass_vulnerable_bloc.freezed.dart';

class CountPassVulnerableBloc extends Bloc<CountPassVulnerableEvent, CountPassVulnerableState> {
  final DataRepository repository;
  CountPassVulnerableBloc({required this.repository}) : super(const CountPassVulnerableState.initial()) {
    on<_Count>((event, emit) async {
      emit(const CountPassVulnerableState.loading());
      try {
        final resp = await repository.countPassVulnerable();
        emit(CountPassVulnerableState.loaded(count: resp));
      } catch (e) {
        emit(const CountPassVulnerableState.error());
      }
    });
  }
}
