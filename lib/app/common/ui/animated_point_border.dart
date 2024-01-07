import "package:flutter/cupertino.dart";

import "package:onelenykco/app/common/ui/border_paint.dart";

class AnimatedPointBorderContainer extends StatefulWidget {

  const AnimatedPointBorderContainer({
    required this.child, super.key,
    this.borderWidth = 3.0,
    this.borderRadius = 10.0,
    this.animationDuration = const Duration(seconds: 10),
  });
  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final Duration animationDuration;

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
  Widget build(final BuildContext context) => AnimatedBuilder(
      animation: _controller,
      builder: (final context, final child) => CustomPaint(
          painter: BorderPainter(
              _controller.value, widget.borderWidth, widget.borderRadius,),
          child: Container(
            padding: EdgeInsets.all(widget.borderWidth + widget.borderRadius),
            child: widget.child,
          ),
        ),
    );
}
