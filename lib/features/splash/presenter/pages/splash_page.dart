import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/app_widget.dart';
import '../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImageView(
                imagePath: AppAssets.appIcon,
                width: AppDimens.dimens80.w,
                height: AppDimens.dimens80.w,
              ),
              SizedBox(
                height: AppDimens.dimens10.h,
              ),
              Text(
                controller.appName.value,
                style: AppTextStyle.textSize32Bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
