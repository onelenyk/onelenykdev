import "package:flutter/material.dart";

class InfoBlock extends StatelessWidget {
  // Constructor to initialize the child widget
  const InfoBlock({required this.child, super.key,
    this.color, this.width, this.padding,});
  final Widget child;

  final Color? color;

  final EdgeInsetsGeometry? padding;

  final double? width;

  @override
  Widget build(final BuildContext context) => Container(
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: padding ?? const EdgeInsets.all(8),
      child: child,
    );
}
