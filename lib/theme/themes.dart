import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextTheme textTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xffCBAB97)),
    headline2: TextStyle(
        fontSize: 20, color: Color(0xffCBAB97), fontWeight: FontWeight.w600),
    headline5: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 14.0));

class AppThemeStyle {
  AppThemeStyle._();

  static Color primaryColor = Color(0xffCBAB97);
  static Color colorSuccess = Color(0xff00BA88);

  static BorderRadiusGeometry topRadius = BorderRadius.only(
      topLeft: const Radius.circular(30.0),
      topRight: const Radius.circular(30.0));

  static TextStyle appBarStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: primaryColor,
    letterSpacing: 0.1,
  );

  static TextStyle appBarStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: primaryColor,
    letterSpacing: 0.1,
  );

  static TextStyle headingColorStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static TextStyle headline1 = TextStyle(
    fontSize: 24,
    color: primaryColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle titleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle resendCodeStyle = TextStyle(
    fontSize: 14,
    color: primaryColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle titleFormStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleStyleColor = TextStyle(
    fontSize: 20,
    color: primaryColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle titleSuccess = TextStyle(
    fontSize: 14,
    color: colorSuccess,
    fontWeight: FontWeight.w400,
  );

  static TextStyle buttonWhite = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonNormal = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle listStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle titleListGrey = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static TextStyle subtitleList = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleListPrimary = TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );

  static TextStyle title14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleColor14 = TextStyle(
    fontSize: 14,
    color: primaryColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle balance = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
}
