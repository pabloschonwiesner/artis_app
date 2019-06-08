import 'package:flutter/material.dart';

class InstagramSignInButton extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return RaisedButton(
    elevation: 7,
    padding: EdgeInsets.all(0),
    color: null,
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE69129), Color(0xFFB22C9D), Color(0xFF670FD8)],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
          stops: [0.0, 0.5, 1.0],
          tileMode: TileMode.clamp
        ),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              color: Color(0x22FFFFFF),
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/images/instagram-icon.png'),
              height: 50,
              width: 50,
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Sign in with Instagram', 
                style: TextStyle(
                  fontSize: 15, 
                  color: Colors.white
                ), 
                textAlign: TextAlign.center,)
            )
          )
        ],
      ),
    ),
    onPressed: () {
      print('instagram');
    },
  );
 }
}