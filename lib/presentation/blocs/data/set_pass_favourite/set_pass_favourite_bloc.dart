import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

part 'set_pass_favourite_event.dart';
part 'set_pass_favourite_state.dart';
part 'set_pass_favourite_bloc.freezed.dart';

class SetPassFavouriteBloc extends Bloc<SetPassFavouriteEvent, SetPassFavouriteState> {
  final DataRepository repository;
  SetPassFavouriteBloc({required this.repository}) : super(const SetPassFavouriteState.initial()) {
    on<_SetPassFavourite>((event, emit) async {
      emit(const SetPassFavouriteState.loading());
      try{
        await repository.addToFavourites(passId:event.passId, value: event.value).then((value) {
          emit(const SetPassFavouriteState.success());
        });
      } on Exception catch(e){
        emit(SetPassFavouriteState.error(message: e.toString()));
      }
    });
  }
}
