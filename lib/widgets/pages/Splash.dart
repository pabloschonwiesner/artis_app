import 'package:artis_app/blocs/blocLogin.dart';
import 'package:artis_app/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:artis_app/widgets/pages/Login/Login.dart';
import 'package:artis_app/widgets/shared/ArtisLogo.dart';
import 'package:artis_app/widgets/shared/ArtisIso.dart';
import 'package:artis_app/utils/sharedPreferencesArtis.dart';

/// Clase que crea la pantalla de Splash que se utliza al iniciar la app
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
 }

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();    
    UserModel userSession = getSession();
    Future.delayed(Duration(seconds: 2), () {
      if(userSession.email.isNotEmpty) {
         Navigator.pushNamed(context, '/login');
      } else {
        Navigator.pushNamed(context, '/landingLogged');
      }
    });    
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           ArtisLogo(aWidth: MediaQuery.of(context).size.width * 0.4),
          // Container(        
          //   padding: EdgeInsets.only(bottom: 20),
          //   width: MediaQuery.of(context).size.width * 0.40,
          //   height: MediaQuery.of(context).size.width * 0.40,  
          //   child: Image.asset('assets/images/artisIcon.png'),
          // ),
          ArtisIso(aFontSize: 40)
          // Text(
          //   'Artis Coffee', 
          //   style: TextStyle(color: Theme.of(context).primaryColor, 
          //   fontSize: 40,
          //   fontFamily: 'Nexa',
          //   fontStyle: FontStyle.italic )

          //   // fontFamily: 'NexaBlac',)
          // )
        ],
       )
            
     )
   );
  }
}