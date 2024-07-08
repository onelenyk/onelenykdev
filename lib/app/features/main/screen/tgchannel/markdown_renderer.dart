import "package:flutter/material.dart";
import "package:flutter_markdown/flutter_markdown.dart";
import "package:google_fonts/google_fonts.dart";
import "package:markdown/markdown.dart";

class MarkdownRenderer extends StatelessWidget {
  const MarkdownRenderer(
      {super.key, required this.data, required this.baseTextStyle});

  final String data;
  final TextStyle baseTextStyle;

  MarkdownStyleSheet getMyMarkdownStyleSheet(final TextStyle baseTextStyle) =>
      MarkdownStyleSheet(
        a: baseTextStyle.copyWith(color: Colors.blue),
        p: baseTextStyle,
        code: baseTextStyle.copyWith(
          color: Colors.black,
          fontFamily: "monospace",
          backgroundColor: Colors.grey[200],
        ),
        h1: baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.normal),
        h2: baseTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.normal),
        h3: baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
        h4: baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.normal),
        h5: baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.normal),
        h6: baseTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
        em: baseTextStyle.copyWith(fontStyle: FontStyle.italic),
        strong: baseTextStyle.copyWith(fontWeight: FontWeight.bold),
        del: baseTextStyle,
        blockquote: baseTextStyle.copyWith(
          fontStyle: FontStyle.italic,
          color: Colors.blueGrey,
        ),
        img: baseTextStyle,
        checkbox: baseTextStyle,
        listBullet: baseTextStyle,
        tableHead: baseTextStyle.copyWith(fontWeight: FontWeight.bold),
        tableBody: baseTextStyle,
      );

  @override
  Widget build(BuildContext context) => Markdown(
      data: data,
      styleSheet: getMyMarkdownStyleSheet(baseTextStyle),
      onTapLink: (text, href, title) {
        // Handle link taps if necessary
      },
      selectable: true,
      shrinkWrap: true,
      padding: EdgeInsets.zero,

      extensionSet: ExtensionSet(
          ExtensionSet.gitHubFlavored.blockSyntaxes,
          ExtensionSet.gitHubFlavored.inlineSyntaxes
      ),
    );
}
