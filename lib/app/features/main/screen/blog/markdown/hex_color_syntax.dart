import "package:markdown/markdown.dart" as md;

class HexColorSyntax extends md.InlineSyntax {
  HexColorSyntax() : super(r"\[#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})\]\((.*?)\)");

  @override
  bool onMatch(final md.InlineParser parser, final Match match) {
    final colorCode = match[1]!;
    final textContent = match[2]!;

    final colorTag = md.Element.text("hexcolor", textContent);
    colorTag.attributes["colorCode"] = colorCode;

    parser.addNode(colorTag);
    return true;
  }
}