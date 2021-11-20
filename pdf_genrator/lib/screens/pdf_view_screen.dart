import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:open_file/open_file.dart';
class PdfViewScreen extends StatelessWidget {
 final String path;
 PdfViewScreen({required this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
    );
  }
}
