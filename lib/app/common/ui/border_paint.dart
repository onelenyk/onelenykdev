import "dart:math";

import "package:flutter/material.dart";

class BorderPainter extends CustomPainter {

  BorderPainter(this.progress, this.borderWidth, this.borderRadius);
  final double progress;
  final double borderWidth;
  final double borderRadius;

  @override
  void paint(final Canvas canvas, final Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(borderWidth / 2, borderWidth / 2,
        size.width - borderWidth, size.height - borderWidth,);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));
    canvas.drawRRect(rrect, paint);

    final pointPaint = Paint()
      ..color = Colors.lightBlue
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.fill;

    final point = _calculatePoint(progress, size, borderRadius, borderWidth);
    canvas.drawCircle(point, borderWidth / 2, pointPaint);
  }

  Offset _calculatePoint(
      final double progress, final Size size, final double borderRadius, final double borderWidth,) {
    final adjustedWidth = size.width - borderWidth;
    final adjustedHeight = size.height - borderWidth;
    final totalLength =
        2 * (adjustedWidth + adjustedHeight - 2 * borderRadius) +
            2 * pi * borderRadius;
    final position = totalLength * progress;

    // Top edge
    if (position < adjustedWidth - borderRadius) {
      return Offset(borderWidth / 2 + position, borderWidth / 2);
    }
    // Right upper corner
    else if (position < adjustedWidth + pi / 2 * borderRadius) {
      return Offset(
          adjustedWidth - borderRadius + borderWidth / 2, borderWidth / 2,) +
          Offset(
              cos(pi / 2 -
                  (position - (adjustedWidth - borderRadius)) /
                      borderRadius,) *
                  borderRadius,
              sin(pi / 2 -
                  (position - (adjustedWidth - borderRadius)) /
                      borderRadius,) *
                  borderRadius,);
    }
    // Right edge
    else if (position <
        adjustedWidth +
            pi / 2 * borderRadius +
            adjustedHeight -
            2 * borderRadius) {
      return Offset(
          size.width - borderWidth / 2,
          borderWidth / 2 +
              borderRadius +
              position -
              adjustedWidth -
              pi / 2 * borderRadius,);
    }
    // Bottom right corner
    else if (position <
        adjustedWidth + adjustedHeight - borderRadius + pi * borderRadius) {
      return Offset(adjustedWidth - borderRadius + borderWidth / 2,
          adjustedHeight - borderRadius + borderWidth / 2,) +
          Offset(
              cos(position -
                  adjustedWidth -
                  adjustedHeight +
                  borderRadius -
                  pi / 2 * borderRadius,) /
                  borderRadius *
                  borderRadius,
              sin(position -
                  adjustedWidth -
                  adjustedHeight +
                  borderRadius -
                  pi / 2 * borderRadius,) /
                  borderRadius *
                  borderRadius,);
    }
    // Bottom edge
    else if (position <
        2 * adjustedWidth +
            adjustedHeight -
            2 * borderRadius +
            pi * borderRadius) {
      return Offset(
          adjustedWidth -
              (position - adjustedWidth - adjustedHeight + pi * borderRadius) +
              borderWidth / 2,
          size.height - borderWidth / 2,);
    }
    // Bottom left corner
    else if (position <
        2 * adjustedWidth +
            2 * adjustedHeight -
            2 * borderRadius +
            1.5 * pi * borderRadius) {
      return Offset(borderWidth / 2 + borderRadius,
          adjustedHeight - borderRadius + borderWidth / 2,) +
          Offset(
              cos(1.5 * pi -
                  (position -
                      2 * adjustedWidth -
                      adjustedHeight +
                      1 * borderRadius),) /
                  borderRadius *
                  borderRadius,
              sin(1.5 * pi -
                  (position -
                      2 * adjustedWidth -
                      adjustedHeight +
                      1 * borderRadius),) /
                  borderRadius *
                  borderRadius,);
    }
    // Left edge
    else if (position <
        2 * (adjustedWidth + adjustedHeight - 2 * borderRadius) +
            1.5 * pi * borderRadius) {
      return Offset(
          borderWidth / 2,
          adjustedHeight -
              (position -
                  2 * adjustedWidth -
                  2 * adjustedHeight +
                  1.5 * pi * borderRadius) +
              borderWidth / 2,);
    }
    // Top left corner
    else {
      return Offset(borderWidth / 2 + borderRadius, borderWidth / 2) +
          Offset(
              cos(2 * pi -
                  (position -
                      2 *
                          (adjustedWidth +
                              adjustedHeight -
                              2 * borderRadius) -
                      1.5 * pi * borderRadius),) /
                  borderRadius *
                  borderRadius,
              sin(2 * pi -
                  (position -
                      2 *
                          (adjustedWidth +
                              adjustedHeight -
                              2 * borderRadius) -
                      1.5 * pi * borderRadius),) /
                  borderRadius *
                  borderRadius,);
    }
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) {
    return true; // Always repaint for a continuous animation
  }
}
