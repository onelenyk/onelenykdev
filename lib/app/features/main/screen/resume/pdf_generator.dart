import "dart:async";
import "dart:convert";
import "dart:html" as html;
import "dart:typed_data";

import "package:flutter/material.dart";
import "package:pdf/pdf.dart";
import "package:pdf/widgets.dart" as pw;

class PdfGenerator {
  static Future<void> savePdf(final Uint8List pdfData, final String fileName) async {
    try {
      final savedFile = await _createPdf(pdfData);
      _downloadFile(savedFile, fileName);
      print("PDF file saved successfully.");
    } catch (e) {
      print("Error saving PDF file: $e");
    }
  }

  // Function to create PDF from data
  static Future<List<int>> _createPdf(final Uint8List pdfData) async {
    final pdf = pw.Document();

    final image = pw.MemoryImage(pdfData);
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat(image.width!.toDouble(), image.height!.toDouble()),
      build: (final context) {
        final ht = context.page.pageFormat.availableHeight;
        final wt = context.page.pageFormat.availableWidth;

        return pw.Container(
          height: ht,
          width: wt,
          color: const PdfColor.fromInt(0xFF343540),
          padding: const pw.EdgeInsets.all(16),
          child: pw.SizedBox(child: pw.Image(image)),
        );
      },
    ),);

    return pdf.save();
  }

  // Function to download the generated PDF file
  static void _downloadFile(final List<int> fileData, final String fileName) {
    final encodedData = base64.encode(fileData);
    final href = "data:application/octet-stream;charset=utf-16le;base64,$encodedData";
    html.AnchorElement(href: href)
      ..setAttribute("download", fileName)
      ..click();
  }

  static Future<dynamic> showCapturedWidget(final BuildContext context, final Uint8List capturedImage) => showDialog(
      useSafeArea: false,
      context: context,
      builder: (final context) => Scaffold(
        appBar: AppBar(
          title: const Text("Captured widget screenshot"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
}
