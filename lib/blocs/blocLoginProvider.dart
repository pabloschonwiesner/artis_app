import 'package:flutter/material.dart';
import 'package:artis_app/blocs/blocLogin.dart';
export 'package:artis_app/blocs/blocLogin.dart';

class BlocLoginProvider extends InheritedWidget {
  final bloc = BlocLogin();

  BlocLoginProvider({Key key, Widget child}) : super(key: key, child: child);
  
  bool updateShouldNotify(_) => true;

  static BlocLogin of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocLoginProvider) as BlocLoginProvider).bloc;
  }

}
