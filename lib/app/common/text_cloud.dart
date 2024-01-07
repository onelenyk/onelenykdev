import "package:flutter/material.dart";
import "dart:math" as math;
import "package:google_fonts/google_fonts.dart";

// Add the WordPositionCalculator class here (from previous example)

class TextCloud extends StatefulWidget {
  const TextCloud({super.key});

  @override
  _TextCloudState createState() => _TextCloudState();
}

class _TextCloudState extends State<TextCloud> {
  final List<String> words = [
    "Android",
    "Flutter",
    "Firebase",
    "Kotlin",
    "Java",
    "Ktor",
    "REST API",
    "Jetpack Compose",
    "Dart",
    "FFmpeg",
    "ChatGPT",
  ];

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
      builder: (final context, final constraints) => FutureBuilder<List<Widget>>(
          future: _calculatePositions(words, constraints),
          builder: (final context, final snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(children: snapshot.data ?? []);
            } else {
              // Show a loading spinner or a placeholder while waiting
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
    );

  Future<List<Widget>> _calculatePositions(
      final List<String> words, final BoxConstraints constraints,) async {
    final random = math.Random();
    final placedRects = <Rect>[];
    final positionedWords = <Widget>[];

    for (final word in words) {
      final fontSize = random.nextInt(15) + 15.0;
      final color = Colors.primaries[random.nextInt(Colors.primaries.length)];

      final textStyle = GoogleFonts.robotoMono(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      );
      final textPainter = TextPainter(
        text: TextSpan(text: word, style: textStyle),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout();

      final textSize = textPainter.size;
      Offset position;
      bool doesOverlap;
      do {
        position = Offset(
          random.nextDouble() * (constraints.maxWidth - textSize.width),
          random.nextDouble() * (constraints.maxHeight - textSize.height),
        );

        final textRect = position & textSize;
        doesOverlap = placedRects.any((final rect) => rect.overlaps(textRect));

        if (!doesOverlap) {
          placedRects.add(textRect);
        }
      } while (doesOverlap);

      positionedWords.add(
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: textStyle.color?.withAlpha(95),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(word, style: textStyle),),
        ),
      );
    }

    return positionedWords;
  }
}

class WordPosition {

  WordPosition(this.word, this.position);
  final String word;
  final Offset position;
}