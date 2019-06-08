import 'package:flutter/material.dart';

class ArtisLogo extends StatelessWidget {
  final double aWidth;

  ArtisLogo({this.aWidth});

 @override
 Widget build(BuildContext context) {
  return Container(        
    padding: EdgeInsets.only(bottom: 20),
    width: aWidth,
    height: aWidth,  
    child: Image.asset('assets/images/artisIcon.png'),
  );
 }
}