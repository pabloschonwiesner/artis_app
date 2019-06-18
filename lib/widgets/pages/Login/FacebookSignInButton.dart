import 'package:artis_app/locale/AppLang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:artis_app/models/UserModel.dart';
import 'package:artis_app/blocs/blocLogin.dart';


/// Clase que crea el boton y la lógica de login de Facebook
class FacebookSignInButton extends StatefulWidget {
  @override
  _FacebookSignInButtonState createState() => _FacebookSignInButtonState();
}

class _FacebookSignInButtonState extends State<FacebookSignInButton> {
  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  /// Función que llama al login de Facebook y redirige si es válido
  /// 
  /// Esta función utiliza la API de Facebook para lanzar una pantalla de login y validar si corresponde a
  /// un usuario registrado. Si no esta registrado o no valida, no hace nada. Si existe toma los datos del usuario,
  /// los guarda en blocLogin y redirige a la pantalla de inicio de todo usuario logueado.
  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    facebookLogin.loginBehavior = FacebookLoginBehavior.nativeWithFallback;
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        // Navigator.pushNamed(context, '/login');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        // Navigator.pushNamed(context, '/login');
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        final token = facebookLoginResult.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
        final profile = json.decode(graphResponse.body);
        print('Desde facebook: $profile');
        String id = profile['id'];
        String nombre = profile['first_name'];
        String apellido = profile['last_name'];
        String email = profile['email'];
        final newUser = UserModel(id: id, origen: 'Facebook', nombre: nombre, apellido: apellido, email: email);
        blocLogin.changeUser(newUser);
        blocLogin.changeLogged(true);
        Navigator.pushNamed(context, '/landingLogged');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 7,
      padding: EdgeInsets.all(0),
      color: Color(0xFF4A6EA9),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              color: Color(0x22FFFFFF),
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/images/facebook-icon.png'),
              height: 50,
              width: 50,
            ),
          ),
          Flexible(
              flex: 4,
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    AppLang.of(context).trans('facebookSignIn'),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  )))
        ],
      ),
      onPressed: () {
        print('facebook');
        blocLogin.isLogged.listen((data) {
          if(data==false) {
            initiateFacebookLogin();
          } else {
            Navigator.pushNamed(context, '/landingLogged');
          }
        });
      },
    );
  }
}
