
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ptf/presentation/utils/language_storage.dart';
import 'language.dart';

part 'language_event.dart';
part 'language_state.dart';

const languagePrefsKey = 'languagePrefs';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<GetLanguage>(onGetLanguage);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    await LanguageStorage.setLang(locale: event.selectedLanguage.value);
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  // # 2
  onGetLanguage(GetLanguage event, Emitter<LanguageState> emit) async {
    final selectedLanguage = await LanguageStorage.getLang();
    emit(state.copyWith(
      selectedLanguage: selectedLanguage == Language.spanish
          ? Language.spanish
          : Language.english,
    ));
  }
}