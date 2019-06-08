import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      print("""Signed in: \n 
      id: ${_googleSignIn.currentUser.id}
      nombre: ${_googleSignIn.currentUser.displayName.split(" ")[0]}
      apellido: ${_googleSignIn.currentUser.displayName.split(" ")[1]}
      email: ${_googleSignIn.currentUser.email}
      pathFoto: ${_googleSignIn.currentUser.photoUrl}
      domain: ${_googleSignIn.hostedDomain}
      """);
    } catch (error) {
      print(error);
    }
  }

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
                'Sign in with Google', 
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
        _handleSignIn();
      },
    );
  }
}