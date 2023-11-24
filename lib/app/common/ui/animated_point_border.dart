import 'package:flutter/cupertino.dart';

import 'border_paint.dart';

class AnimatedPointBorderContainer extends StatefulWidget {
  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final Duration animationDuration;

  AnimatedPointBorderContainer({
    Key? key,
    required this.child,
    this.borderWidth = 3.0,
    this.borderRadius = 10.0,
    this.animationDuration = const Duration(seconds: 10),
  }) : super(key: key);

  @override
  _AnimatedPointBorderContainerState createState() =>
      _AnimatedPointBorderContainerState();
}

class _AnimatedPointBorderContainerState
    extends State<AnimatedPointBorderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: BorderPainter(
              _controller.value, widget.borderWidth, widget.borderRadius),
          child: Container(
            padding: EdgeInsets.all(widget.borderWidth + widget.borderRadius),
            child: widget.child,
          ),
        );
      },
    );
  }
}
