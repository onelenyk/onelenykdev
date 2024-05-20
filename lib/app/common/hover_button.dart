import "package:flutter/material.dart";

class HoverButton extends StatefulWidget {
  const HoverButton({
    required this.child,
    required this.onTap,
    required this.onDoubleTap,
    super.key,
    this.hoverColor = Colors.grey,
    this.color = Colors.black,
    this.radius = 12,
    this.onHover,
    this.clickable = true,
  });

  final Widget child;

  final Color hoverColor;
  final Color color;
  final double radius;
  final VoidCallback onTap;
  final Function? onHover;
  final VoidCallback onDoubleTap;

  final bool clickable;

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;

  @override
  Widget build(final BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovering ? widget.hoverColor : widget.color,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: InkWell(
          onHover: (final value) {
            if (widget.onHover != null) {
              widget.onHover!(value);
            }

            setState(() {
              _isHovering = value;
            });
          },
          onDoubleTap: widget.onDoubleTap,
          onTap: () {
            if (widget.clickable) {
              widget.onTap();
            }
          },
          child: widget.child,
        ),
      );
}
