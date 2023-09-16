import 'dart:ui';
import 'package:ptf/presentation/blocs/app/language/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageStorage{
  static Future<bool> setLang({required Locale locale}) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    try{
      await storage.setString('lang', locale.languageCode);
      return true;
    } catch(e){
      return false;
    }
  }

  static Future<bool> removeLang() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    try{
      await storage.remove('lang');
      return true;
    } catch(e){
      return false;
    }
  }

  static Future<Language> getLang() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    try{
      String? lang = storage.getString('lang');
      if(lang == 'es'){
        return Language.spanish;
      } else {
        return Language.english;
      }
    } catch(e){
      return Language.english;
    }
  }
}