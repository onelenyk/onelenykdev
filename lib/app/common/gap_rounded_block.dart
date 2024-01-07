import 'package:flutter/material.dart';

class GapRoundedBlock extends StatelessWidget {
  final Widget child;

  final Color? backGroundColor;
  final Color? strokeColor;

  final EdgeInsetsGeometry? padding;

  final double? width;

  // Constructor to initialize the child widget
  const GapRoundedBlock(
      {Key? key, required this.child, this.backGroundColor,this.strokeColor, this.width, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: strokeColor ?? Colors.white24,
            style: BorderStyle.solid,
            width: 1.0,
          )),
      child: child,
    );
  }
}
