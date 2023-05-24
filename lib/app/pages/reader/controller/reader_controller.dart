import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:quran_riwayat/app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import '../../../utilities/variables.dart';
import '../widgets/widgets.dart';

class ReaderController extends GetxController {
  final BuildContext context;
  var args = Get.arguments;

  ReaderController(this.context);

  late PdfController pdfController;
  late int docId;
  late int initialPage;

  /// To Enable and Disable the 'Go To Page' Button
  var isButtonActive = false.obs;
  int? toGoPageNumber;

  @override
  void onInit() {
    super.onInit();

    docId = args[0]['docId'];
    initialPage = args[1]['initialPage'];

    pdfController = PdfController(
        document: PdfDocument.openAsset('assets/docs/$docId.pdf'),
        initialPage: initialPage,
        viewportFraction: 1);
  }

  onPageSearchClicked() {
    popUpBottomMenu(
      context: context,
      isScrollController: true,
      child: SearchForPageWidget(
        onTextChange: (String value) {
          onNumberEntered(value);
        },
        onButtonTap: onGoToPageButtonClicked,
      ),
    );
  }

  onNumberEntered(String value) {
    if (value == '') {
      isButtonActive(false);
      return;
    }

    var pageNumber = int.parse(value);

    if (pageNumber < 605 && pageNumber >= 0) {
      toGoPageNumber = pageNumber;
      isButtonActive(true);
    } else {
      isButtonActive(false);
    }
  }

  onGoToPageButtonClicked() {
    if (isButtonActive.value) {
      Get.back();
      pdfController.animateToPage(toGoPageNumber!,
          duration: const Duration(seconds: 2), curve: Curves.linearToEaseOut);
      onPageChanged(toGoPageNumber!);
    } else {
      Toast.defaultToast(context, 'Invalid Number...'.tr);
    }
  }

  onPageChanged(int pageNumber) {
    // store new page into storage with every flip
    StorageUtility.saveInStorage('last_page', '$pageNumber');
    AppVariables.lastPage = '$pageNumber';
  }
}
