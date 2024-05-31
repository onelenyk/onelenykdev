import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";

class TypingAnimation extends HookWidget {
  @override
  Widget build(final BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    final animation =
    Tween<double>(begin: 0, end: 1).animate(animationController);

    return Wrap(
      spacing: 1,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: List.generate(
          3,
              (final index) => FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Interval(index * 0.2, 1.0, curve: Curves.easeInOut),
            ),
            child: const TextDot(),
          )),
    );
  }
}

class TextDot extends StatelessWidget {
  const TextDot({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => SelectableText.rich(
    TextSpan(
      text: ".",
      style: GoogleFonts.robotoMono(
          fontSize: 14,
          color: Colors.white70,
          fontWeight: FontWeight.normal),
    ),
  );
}