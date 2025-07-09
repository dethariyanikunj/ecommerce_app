import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_utils.dart';

class AppTextStyle {
  static TextTheme getTextTheme() => GoogleFonts.getTextTheme('Lato');

  // To use text default style for whole app add style in GetMaterialApp widget
  // theme: ThemeData(textTheme: AppTextStyle.getTextTheme())

  static TextStyle getTextStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? lineHeight,
  }) =>
      GoogleFonts.getFont(
        'Lato',
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color ?? AppColors.color1F1A17,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: lineHeight,
        ),
      );

  static TextStyle get textSize8Bold => getTextStyle(
        fontSize: AppDimens.dimens8.sp,
        fontWeight: FontWeight.w700,
        lineHeight: 10 / 8,
      );

  static TextStyle get textSize10SemiBold => getTextStyle(
        fontSize: AppDimens.dimens10.sp,
        fontWeight: FontWeight.w600,
        lineHeight: 12 / 10,
      );

  static TextStyle get textSize10Bold => getTextStyle(
        fontSize: AppDimens.dimens10.sp,
        fontWeight: FontWeight.w700,
        lineHeight: 12 / 10,
      );

  static TextStyle get textSize12Regular => getTextStyle(
        fontSize: AppDimens.dimens12.sp,
        fontWeight: FontWeight.w400,
        lineHeight: 16 / 12,
      );

  static TextStyle get textSize12SemiBold => getTextStyle(
        fontSize: AppDimens.dimens12.sp,
        fontWeight: FontWeight.w600,
        lineHeight: 16 / 12,
      );

  static TextStyle get textSize14Regular => getTextStyle(
        fontSize: AppDimens.dimens14.sp,
        fontWeight: FontWeight.w400,
        lineHeight: 18 / 14,
      );

  static TextStyle get textSize14SemiBold => getTextStyle(
        fontSize: AppDimens.dimens14.sp,
        fontWeight: FontWeight.w600,
        lineHeight: 18 / 14,
      );

  static TextStyle get textSize14Bold => getTextStyle(
        fontSize: AppDimens.dimens14.sp,
        fontWeight: FontWeight.w700,
        lineHeight: 18 / 14,
      );

  static TextStyle get textSize16Regular => getTextStyle(
        fontSize: AppDimens.dimens16.sp,
        fontWeight: FontWeight.w400,
        lineHeight: 20 / 16,
      );

  static TextStyle get textSize16SemiBold => getTextStyle(
        fontSize: AppDimens.dimens16.sp,
        fontWeight: FontWeight.w600,
        lineHeight: 20 / 16,
      );

  static TextStyle get textSize16Bold => getTextStyle(
        fontSize: AppDimens.dimens16.sp,
        fontWeight: FontWeight.w700,
        lineHeight: 20 / 16,
      );

  static TextStyle get textSize18Regular => getTextStyle(
        fontSize: AppDimens.dimens18.sp,
        fontWeight: FontWeight.w400,
        lineHeight: 22 / 18,
      );

  static TextStyle get textSize18SemiBold => getTextStyle(
        fontSize: AppDimens.dimens18.sp,
        fontWeight: FontWeight.w600,
        lineHeight: 22 / 18,
      );

  static TextStyle get textSize18Bold => getTextStyle(
        fontSize: AppDimens.dimens18.sp,
        fontWeight: FontWeight.w700,
        lineHeight: 22 / 18,
      );

  static TextStyle get textSize22Bold => getTextStyle(
        fontSize: AppDimens.dimens22.sp,
        fontWeight: FontWeight.w700,
        lineHeight: 24 / 18,
      );

  static TextStyle get textSize24Regular => getTextStyle(
        fontSize: AppDimens.dimens24.sp,
        fontWeight: FontWeight.w400,
        lineHeight: 30 / 24,
      );

  static TextStyle get textSize24SemiBold => getTextStyle(
        fontSize: AppDimens.dimens24.sp,
        fontWeight: FontWeight.w600,
        lineHeight: 30 / 24,
      );

  static TextStyle get textSize24Bold => getTextStyle(
        fontSize: AppDimens.dimens24.sp,
        fontWeight: FontWeight.w700,
        lineHeight: 30 / 24,
      );

  static TextStyle get textSize26Regular => getTextStyle(
        fontSize: AppDimens.dimens26.sp,
        fontWeight: FontWeight.w400,
        lineHeight: 32 / 26,
      );

  static TextStyle get textSize26Bold => getTextStyle(
        fontSize: AppDimens.dimens26.sp,
        fontWeight: FontWeight.w700,
        lineHeight: 32 / 26,
      );

  static TextStyle get textSize32Bold => getTextStyle(
        fontSize: AppDimens.dimens32.sp,
        fontWeight: FontWeight.w700,
        lineHeight: 40 / 32,
      );
}
