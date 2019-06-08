import 'package:flutter/material.dart';
import 'package:artis_app/widgets/pages/Login/Login.dart';
import 'package:artis_app/widgets/shared/ArtisLogo.dart';
import 'package:artis_app/widgets/shared/ArtisIso.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
 }

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login()
        ));
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