import 'package:flutter/material.dart';
import 'package:artis_app/utils/validators.dart';

class UserPassSignIn extends StatefulWidget {
  @override
  _UserPassSignInState createState() => new _UserPassSignInState();
 }
class _UserPassSignInState extends State<UserPassSignIn> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _textControllerRecoverPass = TextEditingController();
  GlobalKey<FormState> _keyFormSignIn = GlobalKey<FormState>();
  GlobalKey<FormState> _keyFormUserSignIn = GlobalKey<FormState>();
  
  void _cancelarRecoverPass() {
    print('UserPassSignIn: Boton cancelar');
    Navigator.pop(context);
  }

  void _aceptarRecoverPass() {
    
    if(_keyFormSignIn.currentState.validate()) {
      print('UserPassSignIn: Boton aceptar: ${_textControllerRecoverPass.text}');
      _textControllerRecoverPass.text = '';
      Navigator.pop(context);
    }    
  }


  Future _alertDialogRecoverPass() {
    return showDialog(      
      context: context,
      builder: (context) => AlertDialog(     
        title: Text('Recuperar Contraseña'),
        content: Container(
          height: 85,
          child: Column(          
            children: <Widget>[
              Text('Ingrese su email'),
              Form(
                key: _keyFormSignIn,
                child: TextFormField(
                  autofocus: true,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: _textControllerRecoverPass, 
                  validator: (String value) => validateEmail(value),         
                ), 
              )           
            ],
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            color: Theme.of(context).backgroundColor,
            child: Text('Cancelar', style: TextStyle(color: Theme.of(context).primaryColor)),
            onPressed: _cancelarRecoverPass,
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text('Aceptar', style: TextStyle(color: Theme.of(context).backgroundColor)),
            onPressed: _aceptarRecoverPass,
          ),
          
        ],        
      )
    );
  }

  @override
  Widget build(BuildContext context) {
   return Container(
     child: Column(
       children: <Widget>[
        Form(
          key: _keyFormUserSignIn,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                controller: _userController,
                validator: (String value) => validateUser(value),
                decoration: InputDecoration(
                  labelText: 'User',                 
                ),                
              ),
              // SizedBox(height: 10,){}
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                obscureText: true,
                validator: (String value) => validatePass(value),
                controller: _passController,
                decoration: InputDecoration(
                  labelText: 'Pass',
                )
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        GestureDetector(
              onTap: () {
                print('¿Olvidó su contraseña?');
                _alertDialogRecoverPass();
              },
              child: Text('¿Olvidó su contraseña?', style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              elevation: 15,
              child: Text('Sign In'),
              onPressed: () {
                
                if(_keyFormUserSignIn.currentState.validate()) {
                  print('Sign in');
                  // aca tiene que redirigir a las landin pages que corresponda
                  Navigator.pushNamed(context, '/landing');
                } else {
                  print('Sign in invalid');
                }
              },
            ),
            RaisedButton(
              elevation: 15,
              color: Theme.of(context).backgroundColor,
              child: Text('Sign up', style: TextStyle(color: Theme.of(context).primaryColor)),
              onPressed: () {
                print('Sign Up');
                Navigator.pushNamed(context, '/createUser');
              },
            )
          ],
        )
       ],
     ),
   );
  }
}