import 'package:flutter/material.dart';

class AppStyle {
  AppStyle._();

  static TextStyle defaultStyle = TextStyle(
    fontFamily: 'ProximaNova',
    color: Colors.grey[900],
  );

  static TextStyle title = defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w700);

  static TextStyle subtitle1 = defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle subtitle2 = defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1);

  static TextStyle subtitle3 = defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle h4 = defaultStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, height: 1.33);

  static TextStyle h5 = defaultStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.w600, height: 1.33);

  static TextStyle h6 = defaultStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, height: 1.33);

  static TextStyle xLargeSemibold = defaultStyle.copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    height: 1.33,
  );

  static TextStyle largeSemibold = defaultStyle.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    height: 1.375,
  );

  static TextStyle largeRegular = defaultStyle.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle baseBold = defaultStyle.copyWith(
    color: Colors.grey[700],
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    height: 1.43,
  );

  static TextStyle baseSemibold = defaultStyle.copyWith(
    color: Colors.grey[700],
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 1.43,
  );

  static TextStyle baseRegular = defaultStyle.copyWith(
    color: Colors.grey[700],
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.43,
  );
}
