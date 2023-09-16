import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'watch_pass_vulnerable_event.dart';
part 'watch_pass_vulnerable_state.dart';
part 'watch_pass_vulnerable_bloc.freezed.dart';

class WatchPassVulnerableBloc extends Bloc<WatchPassVulnerableEvent, WatchPassVulnerableState> {
  final DataRepository repository;
  WatchPassVulnerableBloc({required this.repository}) : super(const WatchPassVulnerableState.initial()) {
    on<_Watch>((event, emit) {
      emit(const WatchPassVulnerableState.loading());
      try{
        final stream = repository.watchPasswordsVulnerable();
        emit(WatchPassVulnerableState.streamLoaded(stream: stream));
      } catch (e) {
        emit(const WatchPassVulnerableState.error());
      }
    });
  }
}
