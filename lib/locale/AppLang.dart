import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class AppLang {

  /**
   * Constructor
   * 
   * Recibe el codigo del idioma. Ejemplo: 'en', 'es'
   */
  AppLang(this.locale);
  final Locale locale;
  Map<String, String> _sentences;


  /**
   * Metodo of() para ubicar el archivo de localizaciones dentro del contexto.
   * Retorna la localizaciones
   */
  static AppLang of(BuildContext context) {
    return Localizations.of<AppLang>(context, AppLang);
  }


  /**
   * Metodo load() para cargar el archivo del idioma configurado y la clave dentro del json.
   * Retora true siempre.
   */
  Future<bool> load() async {
    String data = await rootBundle.loadString('assets/locale/${this.locale.languageCode}.json');
    Map<String, dynamic> _result = json.decode(data);
    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });
    return true;
  }

  /**
   * Metodo trans() recibe un String que representa la clave a buscar dentro del json de localizaciones
   * Retorna el valor encontrado por clave dentro del json
   */
  String trans(String key) {
    return this._sentences[key];
  }
}

