import "dart:async";

import "package:flutter/material.dart";

import "package:onelenykco/app/common/hover_button.dart";

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget(
      {required this.child1, required this.child2, super.key});

  final Widget child1;
  final Widget child2;

  @override
  _ExperienceWidgetState createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget>
    with SingleTickerProviderStateMixin {




  @override
  Widget build(final BuildContext context) => HoverButton(
        color: Colors.transparent,
        onTap: () {},
        onDoubleTap: () {},
        onHover: (final isHovered) {

        },
        child: Column(
          children: <Widget>[
            widget.child1,
            widget.child2
          ],
        ),
      );
}
