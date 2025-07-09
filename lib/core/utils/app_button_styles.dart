import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './app_utils.dart';

class AppButtonStyles {
  FilledButtonThemeData get filledButtonTheme => FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.colorE0E0E0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimens.dimensButtonCornerRadius.h,
            ),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
          textStyle: AppTextStyle.textSize16Bold.copyWith(
            color: AppColors.colorWhite,
          ),
        ),
      );

  OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.colorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimens.dimensButtonCornerRadius.h,
            ),
          ),
          side: const BorderSide(
            color: AppColors.colorE0E0E0,
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
          textStyle: AppTextStyle.textSize16Bold,
        ),
      );
}
