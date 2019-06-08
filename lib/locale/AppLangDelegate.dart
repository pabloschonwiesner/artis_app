import 'package:flutter/material.dart';
import 'package:artis_app/locale/AppLang.dart';

class AppLangDelegate extends LocalizationsDelegate<AppLang> {
  const AppLangDelegate();

  @override 
  bool isSupported(Locale locale) {
    return ['en', 'es', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLang> load(Locale locale) async {
    AppLang localizations = AppLang(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLangDelegate old) {
    return false;
  }

}