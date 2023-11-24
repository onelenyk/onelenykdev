import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

// Add the WordPositionCalculator class here (from previous example)

class TextCloud extends StatefulWidget {
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
    "ChatGPT"
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FutureBuilder<List<Widget>>(
          future: _calculatePositions(words, constraints),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(children: snapshot.data ?? []);
            } else {
              // Show a loading spinner or a placeholder while waiting
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }

  Future<List<Widget>> _calculatePositions(
      List<String> words, BoxConstraints constraints) async {
    final random = math.Random();
    List<Rect> placedRects = [];
    List<Widget> positionedWords = [];

    for (String word in words) {
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
      )..layout(minWidth: 0, maxWidth: double.infinity);

      Size textSize = textPainter.size;
      Offset position;
      bool doesOverlap;
      do {
        position = Offset(
          random.nextDouble() * (constraints.maxWidth - textSize.width),
          random.nextDouble() * (constraints.maxHeight - textSize.height),
        );

        Rect textRect = position & textSize;
        doesOverlap = placedRects.any((rect) => rect.overlaps(textRect));

        if (!doesOverlap) {
          placedRects.add(textRect);
        }
      } while (doesOverlap);

      positionedWords.add(
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: textStyle.color?.withAlpha(95),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Text(word, style: textStyle)),
        ),
      );
    }

    return positionedWords;
  }
}

class WordPosition {
  final String word;
  final Offset position;

  WordPosition(this.word, this.position);
}