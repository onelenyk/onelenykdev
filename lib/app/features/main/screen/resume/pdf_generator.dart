import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:onelenykco/app/common/responsive_util.dart';
import 'package:onelenykco/app/features/main/data/resume/resume_cubit.dart';
import 'package:onelenykco/app/features/main/data/resume/resume_state.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../common/hover_button.dart';
import '../../../../common/info_block.dart';
import '../../../../common/ui/expandable_widget.dart';
import '../../data/profile/education_item.dart';
import '../../data/profile/employment_item.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfGenerator {
  static Future<void> savePdf(Uint8List pdfData, String fileName) async {
    try {
      final savedFile = await _createPdf(pdfData);
      _downloadFile(savedFile, fileName);
      print("PDF file saved successfully.");
    } catch (e) {
      print("Error saving PDF file: $e");
    }
  }

  // Function to create PDF from data
  static Future<List<int>> _createPdf(Uint8List pdfData) async {
    final pdf = pw.Document();

    final image = pw.MemoryImage(pdfData);
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat(image.width!.toDouble(), image.height!.toDouble()),
      build: (pw.Context context) {
        var ht = context.page.pageFormat.availableHeight;
        var wt = context.page.pageFormat.availableWidth;

        return pw.Container(
          height: ht,
          width: wt,
          color: const PdfColor.fromInt(0xFF343540),
          padding: const pw.EdgeInsets.all(16),
          child: pw.SizedBox(child: pw.Image(image, fit: pw.BoxFit.contain)),
        );
      },
    ));

    return pdf.save();
  }

  // Function to download the generated PDF file
  static void _downloadFile(List<int> fileData, String fileName) {
    final encodedData = base64.encode(fileData);
    final href = "data:application/octet-stream;charset=utf-16le;base64,$encodedData";
    html.AnchorElement(href: href)
      ..setAttribute("download", fileName)
      ..click();
  }

  static Future<dynamic> showCapturedWidget(BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
  }
}
