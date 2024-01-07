import "package:flutter/material.dart";

class GapRoundedBlock extends StatelessWidget {

  // Constructor to initialize the child widget
  const GapRoundedBlock(
      {required this.child, super.key, this.backGroundColor,this.strokeColor, this.width, this.padding,});
  final Widget child;

  final Color? backGroundColor;
  final Color? strokeColor;

  final EdgeInsetsGeometry? padding;

  final double? width;

  @override
  Widget build(final BuildContext context) => Container(
      width: width,
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: strokeColor ?? Colors.white24,
          ),),
      child: child,
    );
}
