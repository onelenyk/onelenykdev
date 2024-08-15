import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "background_container.dart";

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: BackgroundSvgContainer(
          svgPath: "assets/svg/pattern.svg",
          child: Center(child: child),
        ),
        backgroundColor: Colors.black,
      );
}
