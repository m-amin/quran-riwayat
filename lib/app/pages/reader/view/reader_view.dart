import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

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
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: PdfView(
            controller: PdfController(
                document: PdfDocument.openAsset('assets/docs/$docId.pdf'),
                initialPage: initialPage ?? 604),
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            onPageChanged: (int pageNumber) {
              // store new page into storage with every flip
              StorageUtility.saveInStorage('last_page', '${605 - pageNumber}');
              AppVariables.lastPage = '${605 - pageNumber}';
            },
          ),
        ),
      ),
    );
  }
}
