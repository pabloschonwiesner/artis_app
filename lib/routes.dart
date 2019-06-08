import 'package:flutter/material.dart';
import 'package:artis_app/widgets/pages/Pages.dart';

/**
 *final Map<String, WidgetBuilder> routes
 *
 *Todas las rutas de la applicacion
 */

final Map<String, WidgetBuilder> routes = {
  '/': (context) => Splash(),
  '/login': (context) => Login(),
  '/createUser': (context) => CreateUser(),
  '/landing': (context) => Landing()
};