import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quran_riwayat/app/utilities/app_colors.dart';
import 'package:quran_riwayat/app/utilities/text_themes.dart';
import 'package:quran_riwayat/app/utilities/utilities.dart';

import '../../../widgets/widgets.dart';
import '../widgets/languages_widget.dart';

class LaunchController extends GetxController {
  bool hasRead = false;
  RxString selected = languages.keys.first.obs;

  final BuildContext context;

  LaunchController(this.context);

  @override
  void onInit() {
    // find the selected language in full name eg 'English' by using the current langCode and using it to find the key from the languages map
    selected = languages.keys
        .firstWhere((k) => languages[k] == getCurrentLanguageCode(),
            orElse: () => 'English')
        .obs;

    super.onInit();
  }

  void menuButtonClicked() {
    popUpBottomMenu(
        context: context,
        child: BottomSheetWidget(
          child: [
            BottomSheetTile(
              title: 'Language'.tr,
              icon: const Icon(Icons.translate, color: AppColors.greenColor),
              onPressed: () {
                languagesTilePressed();
              },
            ),
            BottomSheetTile(
              title: 'About'.tr,
              icon: const Icon(Icons.info_outline, color: AppColors.greenColor),
              onPressed: () {
                aboutTilePressed();
              },
            ),
          ],
        ));
  }

  void aboutTilePressed() {
    Get.back();
    popUpBottomMenu(
        isScrollController: true,
        context: context,
        child: BottomSheetWidget(height: 0.75.sh, bottomSpacing: 0, child: [
          Row(
            children: [
              Text(
                'Source:',
                style: TextThemes.mediumSubTitle,
              ),
            ],
          ).marginSymmetric(vertical: 0.01.sh),
          const Text(
            'https://www.islamweb.net/ar/',
            style: TextStyle(color: Colors.blue),
          ).marginAll(0.01.sh),
          const Spacer(),
          Text(
            'لا تنسونا من صالح دعائكم',
            style: TextThemes.mediumSubTitle,
          ).marginAll(0.01.sh),
        ]));
  }

  void languagesTilePressed() {
    Get.back();
    popUpBottomMenu(
      isScrollController: true,
      context: context,
      child: Obx(() {
        return BottomSheetWidget(
            height: 0.75.sh, bottomSpacing: 0, child: languagesList(context));
      }),
    );
  }

  static const Map<String, String> languages = {
    'English': 'en',
    'العربية': 'ar',
    'Türkçe ': 'tr'
  };

  void onRadioChange(String value) {
    selected.value = value;
  }

  /// change the language of the app and store it in local storage for subsequent retrieval
  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    StorageUtility.saveInStorage('lang', langCode);
    Get.updateLocale(locale);
  }

  /// find the current language code that the app is using whether it is from storage or deviceLocale
  String getCurrentLanguageCode() {
    String currentLanguage = StorageUtility.readKey('lang') == null
        ? Get.deviceLocale!.languageCode
        : StorageUtility.readKey('lang')!;

    return currentLanguage;
  }
}