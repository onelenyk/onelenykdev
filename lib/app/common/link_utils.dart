import "dart:html";

import "package:flutter/services.dart";

void openLink(final String url) {
  window.open(url, "_blank");
}


Future<void> downloadPdfFromAssets(final String assetPath) async {
  try {
    // Load the PDF file from assets
    var data = await rootBundle.load(assetPath);
    var bytes = data.buffer.asUint8List();
    final blob = Blob([bytes], "application/pdf");
    final url = Url.createObjectUrlFromBlob(blob);
    final anchor = AnchorElement(href: url)
      ..setAttribute("download", "lenyk_resume.pdf")
      ..click();
    // Clean up the object URL
    Url.revokeObjectUrl(url);
  } catch (e) {
    print("Error downloading PDF: $e");
  }
}