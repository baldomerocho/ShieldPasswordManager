part of 'set_pass_favourite_bloc.dart';

@freezed
class SetPassFavouriteEvent with _$SetPassFavouriteEvent {
  const factory SetPassFavouriteEvent.started() = _Started;
  const factory SetPassFavouriteEvent.setPassFavourite({required String passId, required bool value}) = _SetPassFavourite;
}
