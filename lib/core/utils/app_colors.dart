import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor primaryPalette = MaterialColor(
    primary.value,
    <int, Color>{
      50: primary.withAlpha(10),
      100: primary.withAlpha(20),
      200: primary.withAlpha(30),
      300: primary.withAlpha(40),
      400: primary.withAlpha(50),
      500: primary.withAlpha(60),
      600: primary.withAlpha(70),
      700: primary.withAlpha(80),
      800: primary.withAlpha(90),
      900: primary.withAlpha(100),
    },
  );

  static const Color primary = Color(0xff007CC3);
  static const Color colorWhite = Colors.white;
  static const Color colorBlack = Colors.black;
  static const Color colorTransparent = Colors.transparent;
  static const Color color1F1A17 = Color(0xff1F1A17);
  static const Color color6C6C6C = Color(0xff6C6C6C);
  static const Color colorD32F2F = Color(0xffD32F2F);
  static const Color colorE0E0E0 = Color(0xffE0E0E0);
  static const Color colorA5A5A5 = Color(0xffA5A5A5);
  static const Color colorF0F7FC = Color(0xffF0F7FC);
  static const Color color999999 = Color(0xff999999);
  static const Color colorFCC201 = Color(0xffFCC201);
  static const Color colorDBA514 = Color(0xffDBA514);
  static const Color colorB266FF = Color(0xffB266FF);
  static const Color color914DFF = Color(0xff914DFF);
  static const Color colorF8F8F8 = Color(0xffF8F8F8);
  static const Color colorD9D9D9 = Color(0xffD9D9D9);
  static const Color color388E3C = Color(0xff388E3C);

  static Color colorBarrier = colorBlack.withOpacity(0.6);
  static Color colorBannerRipple = colorBlack.withOpacity(0.08);
  static Color colorScannerBarrier = colorBlack.withOpacity(0.8);
  static Color colorShadowGradient = colorBlack.withOpacity(0.1);
}
