import 'package:flutter/material.dart';
import 'package:artis_app/utils/themeArtis.dart';
import 'package:artis_app/routes.dart';
import 'package:artis_app/utils/validLanguages.dart';

// metodo de inicio de la app
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba',
      theme: artisTheme,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      localeResolutionCallback: localeResolutionCallback,
      initialRoute: '/',
      routes: routes
    );
  }
}










