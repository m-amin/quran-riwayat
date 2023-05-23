import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:quran_riwayat/app/utilities/app_colors.dart';

import '../../../utilities/utilities.dart';
import '../../../utilities/variables.dart';
import '../controller/reader_controller.dart';

class ReaderPage extends StatelessWidget {
  const ReaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReaderController controller = Get.put(ReaderController(context));

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
            leading: const BackButton(
              color: AppColors.dullBlackColor,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.find_in_page_outlined,
                    color: AppColors.dullBlackColor),
                tooltip: 'Go to Page'.tr,
                onPressed: () => controller.onPageSearchClicked(),
              )
            ],
            elevation: 0,
            backgroundColor: AppColors.whiteColor),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: PdfView(
            controller: controller.pdfController,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            onPageChanged: (int pageNumber) =>
                controller.onPageChanged(pageNumber),
            onDocumentError: (error) {
              Toast.defaultToast(context, 'Unexpected error has occurred'.tr);
            },
          ),
        ),
      ),
    );
  }
}
