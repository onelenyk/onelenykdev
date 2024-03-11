import "package:flutter/widgets.dart";
import "package:flutter_svg/flutter_svg.dart";

class SvgManager {
  static const String _basePath = "assets/svg";

  // Define your SVG assets here
  final String iconTelegram = "$_basePath/tg.svg";
  final String iconLinkedin = "$_basePath/linkedin.svg";
  final String iconGithub = "$_basePath/github.svg";
  final String iconDownload = "$_basePath/github.svg";
  // Add more SVG assets as needed

  // This method returns an SvgPicture widget for a given asset name
  SvgPicture svg(String assetName, {double? width, double? height, Color? color}) => SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      color: color,
    );
}