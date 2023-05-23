import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quran_riwayat/app/pages/surah_list/model/surah_model.dart';

import '../../../../routes/app_pages.dart';
import '../../../utilities/utilities.dart';
import '../../../utilities/variables.dart';
import '../../home/model/book_model.dart';
import '../../reader/view/reader_view.dart';

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

  /// when user clicks on a surah it :
  /// 1 : send them to reader page
  /// 2 : stores the bookId and page to storage
  /// 3 : updates the global variables
  void surahWidgetClicked(int index) {
    // Get.to(() => ReaderPage(
    //       docId: args['selected_book']?.id ?? 0,
    //       initialPage: int.parse(displayedSurahs[index].pages ?? '0'),
    //     ));

    Get.toNamed(
      Paths.READER,
      arguments: [
        {'docId': args['selected_book']?.id ?? 0},
        {
          'initialPage': int.parse(displayedSurahs[index].pages ?? '0'),
        },
      ],
    );

    if (args['selected_book']?.id != null &&
        displayedSurahs[index].pages != null) {
      storeLastPage(
          '${args['selected_book']?.id}', displayedSurahs[index].pages!);

      AppVariables.lastPage = displayedSurahs[index].pages!;
      AppVariables.bookId = '${args['selected_book']?.id}';
    }
  }

  void storeLastPage(String bookId, String bookPage) {
    StorageUtility.saveInStorage('book_id', bookId);
    StorageUtility.saveInStorage('last_page', bookPage);
  }
}
