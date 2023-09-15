part of 'set_pass_favourite_bloc.dart';

@freezed
class SetPassFavouriteState with _$SetPassFavouriteState {
  const factory SetPassFavouriteState.initial() = _Initial;
  const factory SetPassFavouriteState.loading() = _Loading;
  const factory SetPassFavouriteState.success() = _Success;
  const factory SetPassFavouriteState.error({required String message}) = _Error;
}
