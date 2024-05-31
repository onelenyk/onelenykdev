
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class BadgeContainer extends StatelessWidget {
  final Widget child;
  final String badgeText;
  final bool showBadge;

  const BadgeContainer(
      {required this.child,
        required this.badgeText,
        final Key? key,
        this.showBadge = true})
      : super(key: key);

  @override
  Widget build(final BuildContext context) => Container(
    child: Stack(
      children: [
        child,
        if (showBadge)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 30,
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  badgeText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}