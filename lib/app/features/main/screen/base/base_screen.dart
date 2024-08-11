import "package:flutter/material.dart";

import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    required this.child,
    this.bottomNavigationBar, // Optional bottom navigation bar
//    this.backgroundColor = const Color(0xFF343540), // Customizable background color
    //   this.borderRadius = 0, // Customizable border radius
    super.key,
  });

  final Widget child;
  final Widget?
      bottomNavigationBar; // Optional BottomNavigationBar
  // final Color backgroundColor; // Background color customization
//  final double borderRadius; // Border radius customization

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   color: backgroundColor,
          //   borderRadius: BorderRadius.circular(borderRadius),
          // ),
          child: Center(child: child),
        ),
        bottomNavigationBar: bottomNavigationBar, // Set bottom navigation bar
      );
}
