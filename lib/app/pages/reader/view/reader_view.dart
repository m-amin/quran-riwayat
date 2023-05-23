import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:quran_riwayat/app/utilities/app_colors.dart';

import '../../../utilities/utilities.dart';
import '../../../utilities/variables.dart';

class ReaderPage extends StatelessWidget {
  const ReaderPage({Key? key, required this.docId, this.initialPage})
      : super(key: key);

  final int docId;
  final int? initialPage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
            leading: const BackButton(
              color: AppColors.dullBlackColor,
            ),
            actions: [
              IconButton(
                icon: const Tooltip(
                  message: "Go to Page",
                  child: Icon(Icons.find_in_page_outlined,
                      color: AppColors.dullBlackColor),
                ),
                onPressed: () {},
              )
            ],
            elevation: 0,
            backgroundColor: AppColors.whiteColor),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: PdfView(
            controller: PdfController(
                document: PdfDocument.openAsset('assets/docs/$docId.pdf'),
                initialPage: initialPage ?? 0),
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            onPageChanged: (int pageNumber) {
              // store new page into storage with every flip
              StorageUtility.saveInStorage('last_page', '$pageNumber');
              AppVariables.lastPage = '$pageNumber';
            },
          ),
        ),
      ),
    );
  }
}
