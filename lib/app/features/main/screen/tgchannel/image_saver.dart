import "dart:convert";
import "dart:typed_data";

import "dart:html" as html;

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:image/image.dart' as img;
import "package:onelenykco/app/features/main/screen/base/mobile_frame.dart";

class ImageSaver {
  static Future<void> saveImage(
      final Uint8List imageData, final String fileName) async {
    try {
      final savedFile = await _createImage(imageData);
      _downloadFile(savedFile, fileName);
      print("Image file saved successfully.");
    } catch (e) {
      print("Error saving image file: $e");
    }
  }

  // Function to create image from data
  static Future<Uint8List> _createImage(final Uint8List imageData) async {
    final image = img.decodeImage(imageData);
    return Uint8List.fromList(img.encodePng(image!));
  }

  // Function to download the generated image file
  static void _downloadFile(final Uint8List fileData, final String fileName) {
    final encodedData = base64.encode(fileData);
    final href = "data:image/png;base64,$encodedData";
    html.AnchorElement(href: href)
      ..setAttribute("download", fileName)
      ..click();
  }

  static Future<dynamic> showCapturedWidget(
          final BuildContext context, final Uint8List capturedImage) =>
      showDialog(
        useSafeArea: false,
        context: context,
        barrierColor: Colors.white.withAlpha(40),
        builder: (final context) => Container(
          child: MobileFrame(child: Center(child: Image.memory(capturedImage))),
        ),
      );
}
