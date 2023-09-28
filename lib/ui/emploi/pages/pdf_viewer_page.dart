
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWidget extends StatefulWidget {
  final Uint8List fileBuffer;
  const PdfViewerWidget({Key? key, required this.fileBuffer}) : super(key: key);

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  PdfViewerController pdfViewerController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfPdfViewer.memory(
          widget.fileBuffer,
          controller: pdfViewerController,
          pageLayoutMode: PdfPageLayoutMode.continuous,
          canShowPaginationDialog: false,
          onHyperlinkClicked: (details) {},
          onPageChanged: (details) {
            setState(() {});
          },
          onDocumentLoaded: (details) {
            setState(() {});
          },
        ),
      ],
    );
  }
}
