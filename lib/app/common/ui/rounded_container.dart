import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";

class RoundedContainerWidget extends StatelessWidget {
  const RoundedContainerWidget({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(final BuildContext context) => Container(
        padding: padding ?? const EdgeInsets.all(16),
        width: 350,
        child: DottedBorder(
          color: Colors.white,
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          padding: const EdgeInsets.all(8),
          strokeWidth: 1.5,
          dashPattern: const [8, 6],
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: child,
          ),
        ),
      );
}
