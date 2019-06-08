import 'package:flutter/material.dart';

/**
 * Nombre del ThemeData seleccionado
 */
final ThemeData artisTheme = _buildArtisTheme();


/**
 * Copia del ThemeData con colores personalizados
 */
ThemeData _buildArtisTheme() {
    return ThemeData(
      accentColor: artisCeramicColor,
      primaryColor: artisCoffeeColor,
      buttonTheme: ButtonThemeData(
        buttonColor: artisCoffeeColor,
        textTheme: ButtonTextTheme.normal
      ),
      scaffoldBackgroundColor: artiseBackgroundWhiteColor,
      cardColor: artiseSurfaceWhiteColor,
      textSelectionColor: artisLatteColor,
      errorColor: artisErrorColor,
      fontFamily: 'NexaBlack',
      backgroundColor: artiseSurfaceWhiteColor
    );
  // final ThemeData base = ThemeData.light();
  // return base.copyWith(
  //   accentColor: artisCeramicColor,
  //   primaryColor: artisCoffeeColor,
  //   buttonTheme: base.buttonTheme.copyWith(
  //     buttonColor: artisCoffeeColor,
  //     textTheme: ButtonTextTheme.normal
  //   ),
  //   scaffoldBackgroundColor: artiseBackgroundWhiteColor,
  //   cardColor: artiseSurfaceWhiteColor,
  //   textSelectionColor: artisLatteColor,
  //   errorColor: artisErrorColor,
  //   fontFamily: 'Nexa'
  // );
}

const artisCoffeeColor = const Color(0xFFB38867);
const artisSlateColor = const Color(0xFF626D71);
const artisCeramicColor = const Color(0xFFCDCDC0);
const artisLatteColor = const Color(0xFFDDBC95);
const artisErrorColor = const Color(0xFFC5032B);
const artiseSurfaceWhiteColor = const Color(0xFFFFFBFA);
const artiseBackgroundWhiteColor = Colors.white;


// const artisPink50 = const Color(0xFFFEEAE6);
// const artisePink100 = const Color(0xFFFEDBD0);
// const artisePink300 = const Color(0xFFFBB8AC);
// const artisePink400 = const Color(0xFFEAA4A4);

// const artiseBrown900 = const Color(0xFF442B2D);

// const artiseErrorRed = const Color(0xFFC5032B);

// const artiseSurfaceWhite = const Color(0xFFFFFBFA);
// const artiseBackgroundWhite = Colors.white;
