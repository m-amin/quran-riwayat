import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class ReaderPage extends StatelessWidget {
  const ReaderPage({Key? key, required this.docId, this.initialPage})
      : super(key: key);

  final int docId;
  final int? initialPage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PdfView(
          controller: PdfController(
              document: PdfDocument.openAsset('assets/docs/$docId.pdf'),
              initialPage: initialPage ?? 604),
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
        ),
      ),
    );
  }
}
