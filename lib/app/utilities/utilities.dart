import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:quran_riwayat/app/utilities/text_themes.dart';

import 'app_colors.dart';

void popUpBottomMenu(
    {required BuildContext context,
    required Widget child,
    bool isScrollController = false,
    FutureOr<void> Function()? onComplete}) {
  showModalBottomSheet<void>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          isScrollControlled: isScrollController,
          context: context,
          builder: (BuildContext context) => child)
      .whenComplete(onComplete ?? () {});
}

class StorageUtility {
  StorageUtility._();

  static final box = GetStorage();

  static void saveInStorage(String key, String value) {
    box.write(key, value);
  }

  static void saveInStorageMap(String key, Map<String, String> value) {
    box.write(key, value);
  }

  static Map<String, dynamic>? readFromStorageMap(String key) {
    Map<String, dynamic>? value = box.read(key);

    return value;
  }

  static String? readKey(String key) {
    String? value = box.read(key);

    return value;
  }

  static void removeKey(String key) {
    box.remove(key);
  }
}

class Toast {
  Toast._();

  static defaultToast(BuildContext context, String message) {
    OverlayEntry entry = OverlayEntry(builder: (context) {
      return Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
        child: Container(
          width: 1.sw,
          alignment: Alignment.center,
          child: Card(
            color: AppColors.dullBlackColor.withOpacity(0.75),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                message,
                style: TextThemes.mediumSubTitle
                    .copyWith(color: AppColors.whiteColor),
              ),
            ),
          ),
        ),
      );
    });

    Overlay.of(context).insert(entry);
    Future.delayed(const Duration(seconds: 3)).then((value) => entry.remove());
  }
}
