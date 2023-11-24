import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final Widget child;

  final Color hoverColor;
  final Color color;
  final double radius;
  final VoidCallback onTap;
  final Function? onHover;
  final VoidCallback onDoubleTap;

  const HoverButton({
    Key? key,
    required this.child,
    required this.onTap,
    required this.onDoubleTap,
    this.hoverColor = Colors.grey,
    this.color = Colors.black,
    this.radius = 12,
    this.onHover}) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _isHovering ? widget.hoverColor : widget.color,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: InkWell(
        onHover: (value) {
          if(widget.onHover != null){
            widget.onHover!(value);
          }

          setState(() {
            _isHovering = value;
          });
        },
        onDoubleTap: widget.onDoubleTap,
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}
