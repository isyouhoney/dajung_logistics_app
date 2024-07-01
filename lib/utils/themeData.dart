import 'package:flutter/material.dart';

class CC {
  static Color mainColor = const Color(0xff0B318F);
  static Color mainColorOpacity = const Color(0xcc0b318f);
  static Color mainColorShaded = const Color(0xff546FB1);
  static Color mainColorShadedLight = const Color(0xffCED6E9);
  static Color whiteColor = const Color(0xffE1E4E6);
  static Color focusBorderColor = const Color(0xffFFD313);
  static Color errorColor = const Color(0xffff5d5d);
  static Color textColor = const Color(0xff363a3d);
  static Color hintColor = const Color(0xff878d91);
}

ThemeData light = ThemeData(
  useMaterial3: false,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)
  ),
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: Colors.white, elevation: 0),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: CC.mainColor,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      // color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      // color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      // color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      // color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      // color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      // color: Colors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      // color: Colors.black,
    ),
      headlineLarge : TextStyle(),
      headlineMedium : TextStyle(),
      headlineSmall : TextStyle(),
      labelLarge : TextStyle(),
      labelMedium : TextStyle(),
      // labelSmall : TextStyle(),
      // headline1 : TextStyle(),
      // headline2 : TextStyle(),
      // headline3 : TextStyle(),
      // headline4 : TextStyle(),
      // headline5 : TextStyle(),
      // headline6 : TextStyle(),
      // subtitle1 : TextStyle(),
      // subtitle2 : TextStyle(),
      // bodyText1 : TextStyle(),
      // bodyText2 : TextStyle(),
      // caption : TextStyle(),
      // button : TextStyle(),
      // overline  : TextStyle(),

  ),
);
ThemeData dark = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  primaryColor: CC.mainColor,
);
