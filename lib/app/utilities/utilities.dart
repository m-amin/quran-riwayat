import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

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

  static Future<String?> readFromStorage(String key) async {
    return box.read(key);
  }

  static String? readKey(String key) {
    String? value = box.read(key);

    return value;
  }

  static void removeKey(String key) {
    box.remove(key);
  }
}
