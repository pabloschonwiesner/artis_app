import 'package:flutter/material.dart';
import 'package:artis_app/locale/AppLangDelegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/**
 * Lista de idiomas permitidos para la app
 */
final Iterable<Locale> supportedLocales = [
  Locale('en', 'US'),
  Locale('es', 'ES')
];


/**
 * Callback responsable de setear el idioma de la app a partir del idioma del dispositivo,
 * o del idioma seleccionado por el usuario 
 */
Locale localeResolutionCallback(Locale locale, Iterable<Locale> supportedLocales) {
  for(Locale supportedLocale in supportedLocales) {
    if(supportedLocale.languageCode == locale.languageCode || supportedLocale.countryCode == locale.countryCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}

/**
 * Delegación de localizaciones
 */
Iterable<LocalizationsDelegate> localizationsDelegates = [
  AppLangDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate
];