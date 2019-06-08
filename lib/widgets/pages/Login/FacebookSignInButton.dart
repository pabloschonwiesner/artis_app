// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';

// class FacebookSignInButton extends StatefulWidget {
//   @override
//   _FacebookSignInButtonState createState() => _FacebookSignInButtonState();
// }

// class _FacebookSignInButtonState extends State<FacebookSignInButton> {
//   bool isLoggedIn = false;

//   void onLoginStatusChanged(bool isLoggedIn) {
//     setState(() {
//       this.isLoggedIn = isLoggedIn;
//     });
//   }

//   void initiateFacebookLogin() async {
//     var facebookLogin = FacebookLogin();
//     var facebookLoginResult =
//         await facebookLogin.logInWithReadPermissions(['email']);
//      switch (facebookLoginResult.status) {
//       case FacebookLoginStatus.error:
//         print("Error");
//         onLoginStatusChanged(false);
//         break;
//       case FacebookLoginStatus.cancelledByUser:
//         print("CancelledByUser");
//         onLoginStatusChanged(false);
//         break;
//       case FacebookLoginStatus.loggedIn:
//         print("LoggedIn");
//         onLoginStatusChanged(true);
//         break;
//     }
//   }

//  @override
//  Widget build(BuildContext context) {
//   return RaisedButton(
//     elevation: 7,
//     padding: EdgeInsets.all(0),
//     color: Color(0xFF4A6EA9),
//     child: Row(
//       children: <Widget>[
//         Flexible(
//           flex: 1,
//           child: Container(
//             color: Color(0x22FFFFFF),
//             padding: EdgeInsets.all(10),
//             child: Image.asset('assets/images/facebook-icon.png'),
//             height: 50,
//             width: 50,
//           ),
//         ),
//         Flexible(
//           flex: 4,
//           child: Container(
//             alignment: Alignment.center,
//             child: Text(
//               'Sign in with Facebook', 
//               style: TextStyle(
//                 fontSize: 15, 
//                 color: Colors.white
//               ), 
//               textAlign: TextAlign.center,)
//           )
//         )
//       ],
//     ),
//     onPressed: () {
//       print('facebook');
//       initiateFacebookLogin();
//     },
//   );
//  }
// }