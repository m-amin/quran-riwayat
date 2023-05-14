import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quran_riwayat/routes/app_pages.dart';

void main() {
  runApp(ScreenUtilInit(
    builder: (BuildContext context, Widget? child) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes);
    },
  ));
}
