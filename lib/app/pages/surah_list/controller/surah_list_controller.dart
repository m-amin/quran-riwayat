import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quran_riwayat/app/pages/surah_list/model/surah_model.dart';

import '../../home/model/book_model.dart';

class SurahsController extends GetxController {
  Map<String, Book> args = Get.arguments[0];
  var surahs = <Surah>[].obs;
  var isLoading = false.obs;
  var isFailed = false.obs;

  @override
  void onInit() {
    getJsonData();

    super.onInit();
  }

  void getJsonData() async {
    // read asset json file and convert to string then to json Map
    isLoading(true);
    try {
      DefaultAssetBundle.of(Get.arguments[1]['context'])
          .loadString("assets/json/surahs.json")
          .then((value) {
        print(value);

        if (value.isNotEmpty) {
          surahs.value = surahsFromJson(value);
        }

        isLoading(false);
        isFailed(false);
      });
    } catch (e) {
      print('error reading json :\n $e');
      isLoading(false);
      isFailed(true);
    }

    print(surahs.length);
    print(surahs.last.title);
  }
}
