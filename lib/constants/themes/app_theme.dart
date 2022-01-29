import 'package:flutter/material.dart';

import 'textstyle.dart';

class AppTheme {
  AppTheme._();
  static Color lightBackgroundColor = const Color(0xffffdd5e);
  static Color lightPrimaryColor = const Color(0xff23221c);
  static Color lightAccentColor = const Color(0xFFfffbec);
  static Color lightDividerColor = Colors.grey.shade800;

  static Color darkBackgroundColor = const Color(0xFF2b2b2b);
  static Color darkPrimaryColor = const Color(0xffc2f3dc);
  static Color darkAccentColor = const Color(0xFF3b3b3b);
  static Color darkDividerColor = Colors.white;

  static Color priceColor = const Color(0xffF14652);
  static Color lightxyzColor = const Color(0xffffd956);
    static Color darkxyzColor = const Color(0xff666666);

  static Color darkouterboxCol = const Color(0xff363636);
  static Color lightOuterboxCol = const Color(0xffd5c280);

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: appTextTheme.apply(
        bodyColor: lightPrimaryColor, displayColor: lightPrimaryColor),
    primaryColor: lightPrimaryColor,
    // accentColor: lightAccentColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    backgroundColor: lightBackgroundColor,
    shadowColor: Colors.grey.shade300,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textButtonTheme: _getTextButtonData(),
    outlinedButtonTheme: _getOutlinedButtonData(),
    cardTheme: _getCardTheme(),
    appBarTheme: _getAppBarTheme([lightBackgroundColor, lightPrimaryColor]),
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: appTextTheme.apply(
        bodyColor: darkPrimaryColor, displayColor: darkPrimaryColor),
    primaryColor: darkPrimaryColor,
    // accentColor: darkAccentColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    backgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    shadowColor: Colors.grey.shade900,
    textButtonTheme: _getTextButtonData(),
    outlinedButtonTheme: _getOutlinedButtonData(),
    cardTheme: _getCardTheme(),
    appBarTheme: _getAppBarTheme([darkBackgroundColor, darkPrimaryColor]),
  );

  static TextButtonThemeData _getTextButtonData() {
    return TextButtonThemeData(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(0, 5.5)),
            shape: MaterialStateProperty.resolveWith((states) {
              return const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)));
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey;
              } else {
                return Colors.white;
              }
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey.shade300;
              } else {
                return lightPrimaryColor;
              }
            })));
  }

  static OutlinedButtonThemeData _getOutlinedButtonData() {
    return OutlinedButtonThemeData(
        style: ButtonStyle(
      side: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return const BorderSide(
            color: Colors.grey,
          );
        } else {
          return BorderSide(color: lightPrimaryColor);
        }
      }),
      minimumSize: MaterialStateProperty.all(const Size(0, 5.5)),
      shape: MaterialStateProperty.resolveWith((states) {
        return const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)));
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        } else {
          return lightPrimaryColor;
        }
      }),
    ));
  }

  static CardTheme _getCardTheme() {
    return CardTheme(
        margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)));
  }

  static AppBarTheme _getAppBarTheme(var colors) {
    return AppBarTheme(
      color: colors[0],
      foregroundColor:colors[1],
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color:
            //  thememod == Brightness.light ? lightPrimaryColor :
            colors[1],
      ),
    );
  }
}
