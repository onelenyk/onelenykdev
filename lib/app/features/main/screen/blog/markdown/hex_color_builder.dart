import "package:flutter/material.dart";
import "package:flutter_markdown/flutter_markdown.dart";
import "package:google_fonts/google_fonts.dart";
import "package:markdown/markdown.dart" as md;

class HexColorBuilder extends MarkdownElementBuilder {
  MarkdownStyleSheet getMyMarkdownStyleSheet(final TextStyle baseTextStyle) =>
      MarkdownStyleSheet(
        a: baseTextStyle.copyWith(color: Colors.blue),
        // Customize as needed
        p: baseTextStyle,
        code: baseTextStyle.copyWith(
          color: Colors.black,
          fontFamily: "monospace", // Replace with a monospace font
          backgroundColor: Colors.grey[200],
        ),
        h1: baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        h2: baseTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
        h3: baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        h4: baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        h5: baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        h6: baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        em: baseTextStyle.copyWith(fontStyle: FontStyle.italic),
        strong: baseTextStyle.copyWith(fontWeight: FontWeight.bold),
        del: baseTextStyle,
        // Customize as needed
        blockquote: baseTextStyle.copyWith(
          fontStyle: FontStyle.italic,
          color: Colors.blueGrey,
        ),
        img: baseTextStyle,
        // Customize as needed
        checkbox: baseTextStyle,
        // Customize as needed
        listBullet: baseTextStyle,
        tableHead: baseTextStyle.copyWith(fontWeight: FontWeight.bold),
        tableBody: baseTextStyle, // Customize as needed
      );

  @override
  Widget visitElementAfter(final md.Element element, final TextStyle? style) {
    final colorCode = element.attributes["colorCode"];

    int.parse(colorCode!, radix: 16);
    final baseTextStyle = GoogleFonts.robotoMono(
      color: Color(int.parse(colorCode, radix: 16)),
      fontWeight: FontWeight.normal,
    );

    return MarkdownBody(
      selectable: true,
      styleSheet: getMyMarkdownStyleSheet(baseTextStyle),
      data: element.textContent,);
  }
}