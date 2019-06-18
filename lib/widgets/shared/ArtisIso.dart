import 'package:artis_app/locale/AppLang.dart';
import 'package:flutter/material.dart';


/// Clase que crea el isotipo de Artis
class ArtisIso extends StatelessWidget {
  final double aFontSize;

  ArtisIso({this.aFontSize});
  
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLang.of(context).trans('artisIso'), 
      style: TextStyle(color: Theme.of(context).primaryColor, 
        fontSize: aFontSize,
        fontFamily: 'Nexa',
        fontStyle: FontStyle.italic 
      )      // fontFamily: 'NexaBlac',)
    );
 }
}