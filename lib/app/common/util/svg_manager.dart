import "package:flutter/widgets.dart";
import "package:flutter_svg/flutter_svg.dart";

class SvgManager {
  static const String _basePath = "assets/svg/";

  static SvgPicture flutter({double? width, double? height}) {
    return _getIcon('flutter', width: width, height: height);
  }

  // Private method to return an SVG icon by its name
  static SvgPicture _getIcon(String name, {double? width, double? height}) {
    return SvgPicture.asset(
      '$_basePath$name.svg',
      width: width,
      height: height,
    );
  }
}
