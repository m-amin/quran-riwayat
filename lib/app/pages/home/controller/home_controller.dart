import 'package:get/get.dart';

import '../model/book_model.dart';

class HomeController extends GetxController {
  final List<Book> quranBooks = [
    Book(0, "حفص عن عاصم", "Hafs 'an Aasim"),
    Book(1, "شعبة عن عاصم", "Shu'bah 'an Aasim"),
    Book(2, "ورش عن نافع", "Warsh 'an Nafiʽ"),
    Book(3, "قالون عن نافع", "Qalun 'an Nafiʽ"),
    Book(4, "السوسي عن أبي عمرو", "Al-Soussi 'an Abi 'Amr"),
    Book(5, "الدوري عن أبي عمرو", "Al-Douri 'an Abi 'Amr"),
    Book(6, "الدوري عن الكسائي", "Al-Douri 'an Al-Kisa'i"),
    Book(7, "ابي الحارث عن الكسائي", "Abu Al-Haarith 'an Al-Kisa'i"),
    Book(8, "هشام عن ابن عامر", "Hisham 'an Ibn Amir"),
    Book(9, "ابن ذكوان عن ابن عامر", "Ibn Thakouan 'an Ibn Amir"),
    Book(10, "إدريس الحداد عن خلف العاشر",
        "Idris al-Haddad 'an Khalaf Al-ʿaashir"),
    Book(11, "إسحاق الوراق عن خلف العاشر",
        "Ishaq Al-Warraq 'an Khalaf Al-ʿaashir"),
    Book(12, "ابن جماز عن أبي جعفر", "Ibn Jummaz 'an Abu Ja'far"),
    Book(13, "ابن وردان عن أبي جعفر", "ibn Wirdan 'an Abu Ja'far"),
    Book(14, "خلاد عن حمزة", "Khallad 'an Hamzah"),
    Book(15, "خلف عن حمزة", "Khalaf 'an Hamzah"),
    Book(16, "قنبل عن ابن كثير", "Qunbul 'an Ibn Kathir"),
    Book(17, "البزي عن ابن كثير", "Al-Bazzi 'an Ibn Kathir"),
    Book(18, "روح عن يعقوب الحضرمي", "Ruwh 'an Yaqoub al-Hadrami"),
    Book(19, "رويس عن يعقوب الحضرمي", "Ruwais 'an Yaqoub al-Hadrami"),
    Book(20, "ورش عن نافع من طريق الأصبهاني", "Warsh 'an Nafiʽ (Al-Assbahani)"),
  ];
}
