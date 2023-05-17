import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quran_riwayat/app/pages/surah_list/model/surah_model.dart';

import '../../home/model/book_model.dart';

class SurahsController extends GetxController {
  Map<String, Book> args = Get.arguments[0];
  var allSurahs = <Surah>[].obs;
  var displayedSurahs = <Surah>[].obs;
  var isLoading = false.obs;
  var isFailed = false.obs;

  @override
  void onInit() {
    getJsonData();

    super.onInit();
  }

  /// Provides the surahs list to display in the Listview
  void getJsonData() async {
    // read asset json file and convert to string then to json Map
    isLoading(true);
    try {
      DefaultAssetBundle.of(Get.arguments[1]['context'])
          .loadString("assets/json/surahs.json")
          .then((value) {
        // convert the json string to a list of surah to use in listview
        if (value.isNotEmpty) {
          allSurahs.value = surahsFromJson(value);
          displayedSurahs(
              allSurahs); //assigned the surahs list to display all surahs when searchBox not used or empty
        }

        isLoading(false);
        isFailed(false);
      });
    } catch (e) {
      print('error reading json :\n $e');

      isLoading(false);
      isFailed(true);
    }
  }

  /// Changes the displayed surahs list based on searched string
  void search(String text) {
    //if empty then display all surahs
    if (text.isEmpty) {
      displayedSurahs(allSurahs);
    } else {
      displayedSurahs.value = allSurahs.where((surah) {
        var surahNameEn = surah.title?.toLowerCase() ?? '';
        var surahNameAr = surah.titleAr ?? '';
        return surahNameEn.contains(text.toLowerCase()) ||
            surahNameAr.contains(text);
      }).toList();
    }
  }
}
