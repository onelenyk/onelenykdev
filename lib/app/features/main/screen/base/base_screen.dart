import "package:flutter/material.dart";

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF343540),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(child: child)),
      );
}
