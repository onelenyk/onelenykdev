import "package:flutter/material.dart";

class MobileFrame extends StatelessWidget {
  const MobileFrame({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: 375,
        height: 667,
        child: Center(child: child),
      );
}
