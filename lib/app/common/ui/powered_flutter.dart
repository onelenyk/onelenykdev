import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/util/svg_manager.dart";

class PoweredByFlutterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Using Flutter logo from assets, make sure you have added a Flutter logo SVG in your assets folder
        SvgManager.flutter(width: 24, height: 24),
        SizedBox(width: 10),
        // Provides some spacing between the logo and the text
        Text(
          'Powered by Flutter',
          style: GoogleFonts.robotoMono(
              fontSize: 14,
              fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
