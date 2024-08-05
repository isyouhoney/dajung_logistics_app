import 'package:flutter/material.dart';

class CC {
  static Color mainColor = const Color(0xff01B5BE);
  static Color subColor = const Color(0xffB3E9EC);
  static Color backgroundColor = const Color(0xcccae9ec);
  static Color mainColorOpacity = const Color(0xcc01B5BE);
  static Color mainColorShaded = const Color(0xff3A8689);
  static Color mainColorShadedLight = const Color(0xffCED6E9);
  static Color whiteColor = const Color(0xffE1E4E6);
  static Color focusBorderColor = const Color(0xffFFD313);
  static Color errorColor = const Color(0xffff6d6d);
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
      fontWeight: FontWeight.w700,
      // color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      // color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      // color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
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
      headlineLarge : TextStyle(
          fontSize: 18,
        fontWeight: FontWeight.w500),
      headlineMedium : TextStyle(fontSize: 16,
          fontWeight: FontWeight.w500, color: Colors.black),
      headlineSmall : TextStyle(fontSize: 14,
          fontWeight: FontWeight.w500),
      labelLarge : TextStyle(fontSize: 16,
          fontWeight: FontWeight.w700),
      labelMedium : TextStyle(fontSize: 14,
          fontWeight: FontWeight.w600),
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
