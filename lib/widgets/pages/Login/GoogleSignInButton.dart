import 'package:artis_app/blocs/blocLogin.dart';
import 'package:artis_app/locale/AppLang.dart';
import 'package:artis_app/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Propiedad privada del tipo GoogleSignIn con configuración para acceder al login de Google
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);


/// Función que llama al login de Google y redirige si es válido
  /// 
  /// Esta función utiliza la API de Google para lanzar una pantalla de login y validar si corresponde a
  /// un usuario registrado. Si no esta registrado o no valida, no hace nada. Si existe toma los datos del usuario,
  /// los guarda en blocLogin y redirige a la pantalla de inicio de todo usuario logueado.
Future<void> _handleSignIn(BuildContext context) async {
    try {
      await _googleSignIn.signIn();
      String id = _googleSignIn.currentUser.id;
      String nombre = _googleSignIn.currentUser.displayName.split(" ")[0];
      String apellido = _googleSignIn.currentUser.displayName.split(" ")[1];
      String email = _googleSignIn.currentUser.email;
      final newUser = UserModel(id: id, origen: 'Google', nombre: nombre, apellido: apellido, email: email);
      blocLogin.changeUser(newUser);
      blocLogin.changeLogged(true);
      Navigator.pushNamed(context, '/landingLogged');
    } catch (error) {
      print(error);
    }
  }

/// Clase que crea el boton y la lógica de login de Google
class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 7,
      padding: EdgeInsets.all(0),
      color: Color(0xFFD3514D),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              color: Color(0x22FFFFFF),
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/images/google-icon.png'),
              height: 50,
              width: 50,
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                AppLang.of(context).trans('googleSignIn'), 
                style: TextStyle(
                  fontSize: 15, 
                  color: Colors.white
                ), 
                textAlign: TextAlign.center,)
            )
          )
        ],
      ),
      onPressed: () {
        print('Google');
        blocLogin.isLogged.listen((data) {
          if(data==false) {
            _handleSignIn(context);
          } else {
            Navigator.pushNamed(context, '/landingLogged');
          }
        });
        
      },
    );
  }
}