import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget wrapWithTestApp(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(428, 926),
    ensureScreenSize: true, // ✅ <- this is important for test environments
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, _) => GetMaterialApp(
      home: Scaffold(body: child),
    ),
  );
}
