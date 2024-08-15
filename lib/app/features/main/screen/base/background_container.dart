
import "package:flutter/widgets.dart";
import "package:flutter_svg/flutter_svg.dart";

class BackgroundSvgContainer extends StatelessWidget {
  final Widget child;
  final String svgPath;

  const BackgroundSvgContainer({
    Key? key,
    required this.child,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            svgPath,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
