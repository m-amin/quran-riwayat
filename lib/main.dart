import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran_riwayat/app/utilities/constants.dart';
import 'package:quran_riwayat/routes/app_pages.dart';
import 'package:quran_riwayat/translations/translation.dart';

import 'app/utilities/utilities.dart';

void main() async {
  await GetStorage.init();
  runApp(ScreenUtilInit(
    builder: (BuildContext context, Widget? child) {
      return GetMaterialApp(
        theme: AppConstants.appTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        translations: Translation(),
        locale: StorageUtility.readKey('lang') == null
            ? Get.deviceLocale
            : Locale(StorageUtility.readKey('lang')!),
        fallbackLocale: const Locale("en"),
      );
    },
  ));
}
