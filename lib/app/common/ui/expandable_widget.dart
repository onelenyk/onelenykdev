import "dart:async";

import "package:flutter/material.dart";

import "package:onelenykco/app/common/hover_button.dart";

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget(
      {required this.child1, required this.child2, super.key});

  final Widget child1;
  final Widget child2;

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  bool _isExpanded = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    final durationMillis = _isHovered ? 600 : 300;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: durationMillis),
    );

    final endValue = _isHovered ? 0.2 : 1.0;
    _sizeAnimation =
        Tween<double>(begin: 0, end: endValue).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  Timer? _debounce;

  void toggleHover(final bool isHovered) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: _isHovered ? 500 : 1000), () {
      _toggleHover(isHovered);
    });
  }

  void _toggleHover(final bool isHovered) {
    setState(() {
      _isHovered = isHovered;

      final durationMillis = _isHovered ? 300 : 300;
      _controller.duration = Duration(milliseconds: durationMillis);

      if (_isHovered) {
        _controller.forward();
        return;
      } else {
        if (_isExpanded) {
          return;
        } else {
          _controller.reverse();
          return;
        }
      }
    });
  }

  @override
  Widget build(final BuildContext context) => HoverButton(
        color: _isHovered ? Colors.grey : Colors.transparent,
        onTap: _toggleExpand,
        onDoubleTap: () {},
        onHover: (final isHovered) {
          toggleHover(isHovered);
        },
        child: Column(
          children: <Widget>[
            widget.child1,
            SizeTransition(
              sizeFactor: _sizeAnimation,
              child: widget.child2,
            ),
          ],
        ),
      );
}
