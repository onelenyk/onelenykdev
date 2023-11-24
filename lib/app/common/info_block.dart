import 'package:flutter/material.dart';

class InfoBlock extends StatelessWidget {
  final Widget child;

  final Color? color;

  final EdgeInsetsGeometry? padding;

  final double? width;
  // Constructor to initialize the child widget
  const InfoBlock({Key? key,
    required this.child,
    this.color, this.width, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: padding ?? const EdgeInsets.all(8),
      child: child,
    );
  }
}
