import 'dart:html';

import 'package:flutter/services.dart';

void openLink(String url) {
  window.open(url, '_blank');
}


Future<void> downloadPdfFromAssets(String assetPath) async {
  try {
    // Load the PDF file from assets
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    final blob = Blob([bytes], 'application/pdf');
    final url = Url.createObjectUrlFromBlob(blob);
    final anchor = AnchorElement(href: url)
      ..setAttribute('download', 'lenyk_resume.pdf')
      ..click();
    // Clean up the object URL
    Url.revokeObjectUrl(url);
  } catch (e) {
    print('Error downloading PDF: $e');
  }
}