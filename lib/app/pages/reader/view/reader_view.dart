import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class ReaderPage extends StatelessWidget {
  const ReaderPage({Key? key, required this.docId}) : super(key: key);

  final int docId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PdfView(
          controller: PdfController(
              document: PdfDocument.openAsset('assets/docs/$docId.pdf'),
              initialPage: 604),
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
        ),
      ),
    );
  }
}
