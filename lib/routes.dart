import 'package:flutter/material.dart';
import 'package:artis_app/widgets/pages/Pages.dart';

/// Rutas de la app

final Map<String, WidgetBuilder> routes = {
  '/': (context) => Splash(),
  '/login': (context) => Login(),
  '/createUser': (context) => CreateUser(),
  '/landingLogged': (context) => LandingLogged(),
  '/landingNoLogged': (context) => LandingNoLogged()
};