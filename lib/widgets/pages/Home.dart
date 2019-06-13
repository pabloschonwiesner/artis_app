import 'package:flutter/material.dart';
import 'package:artis_app/locale/AppLang.dart';


/// Clase que crea la estructura inicial del soft
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(AppLang.of(context).trans('titleApp')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                AppLang.of(context).trans('buttonHomePage'),
                style: TextStyle(fontSize: 20),),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            )
          ],
        ),
      ),
    );
  }
}