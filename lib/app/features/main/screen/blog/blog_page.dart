import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_markdown/flutter_markdown.dart";
import "package:flutter_svg/svg.dart";
import "package:intl/intl.dart";

import 'package:markdown/markdown.dart' as md;

import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/features/main/screen/blog/post_site.dart";
import "package:onelenykco/app/features/main/screen/blog/post_template.dart";

import "../../../../common/hover_button.dart";
import "../../../../common/link_utils.dart";

@RoutePage()
class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final List<Note> notes = [
    site
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Container(
            color: Colors.grey.shade900,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InfoBlock(
                      color: Colors.deepOrange.shade200.withOpacity(0.4),
                      width: 800,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "create, explore, expand, conquer",
                              style: GoogleFonts.robotoMono(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "onelenyk.dev",
                                style: GoogleFonts.robotoMono(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "2024",
                                style: GoogleFonts.robotoMono(
                                  fontSize: 12,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.separated(
                      itemCount: notes.length,
                      itemBuilder: (final context, final index) {
                        final item = notes[index];

                        return MyPostWidget(
                          note: item,
                        );
                      },
                      separatorBuilder: (final context, final index) =>
                          const SizedBox(height: 8),
                    ),
                  ),
                ],
              ),
            )),
      );
}

class MyPostWidget extends StatefulWidget {
  MyPostWidget({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  _MyPostWidgetState createState() => _MyPostWidgetState();
}

class _MyPostWidgetState extends State<MyPostWidget> {
  bool showMore = false;

  final TextStyle baseTextStyle = GoogleFonts.robotoMono(
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );

  String cutText(String text, int limit) {
    if (text.length <= limit) {
      return text; // No need to cut if the text is within the limit
    }

    // Find the last space within the limit
    int lastSpaceIndex = text.lastIndexOf(' ', limit);

    // If there is no space within the limit, cut at the limit
    if (lastSpaceIndex == -1) {
      return text.substring(0, limit);
    }

    // Otherwise, cut at the last space within the limit
    return text.substring(0, lastSpaceIndex);
  }

  String shortenName(String nameRaw,
      {int nameLimit = 10, bool addDots = false}) {
    //* Limiting val should not be gt input length (.substring range issue)
    final max = nameLimit < nameRaw.length ? nameLimit : nameRaw.length;
    //* Get short name
    final name = cutText(nameRaw, max);
    //* Return with '..' if input string was sliced
    if (addDots && nameRaw.length > max) {
      return name + """\n[...read more](/more)""";
    } else {
      return name;
    }
  }

  MarkdownStyleSheet getMyMarkdownStyleSheet(final TextStyle baseTextStyle) =>
      MarkdownStyleSheet(
        a: baseTextStyle.copyWith(color: Colors.blue),
        // Customize as needed
        p: baseTextStyle,
        code: baseTextStyle.copyWith(
          color: Colors.black,
          fontFamily: 'monospace', // Replace with a monospace font
          backgroundColor: Colors.grey[200],
        ),
        h1: baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold),
        h2: baseTextStyle.copyWith(fontSize: 22.0, fontWeight: FontWeight.bold),
        h3: baseTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
        h4: baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
        h5: baseTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
        h6: baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
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
  Widget build(BuildContext context) {
    String data;
    if (!showMore) {
      data = shortenName(widget.note.note, nameLimit: 280, addDots: true);
    } else {
      data = widget.note.note + """\n[...less](/less)""";
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: InfoBlock(
              width: 800,
              color: Colors.deepOrange.shade300,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: SvgPicture.asset(
                            "assets/svgs/head.svg",
                          ),
                        ),
                        radius: 26,
                        backgroundColor: Colors.deepOrange.shade200,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Nazar Lenyk",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            formatDateTime(widget.note.date),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.robotoMono(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Markdown(
                    styleSheet: getMyMarkdownStyleSheet(baseTextStyle),
                    onTapLink: (text, href, title) {
                      if (href == "/more" || href == "/less") {
                        setState(() {
                          showMore = !showMore;
                        });
                      } else {
                        openLink(href ?? "");
                      }
                    },
                    data: data,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(8),
                    selectable: true,
                    inlineSyntaxes: [HexColorSyntax()],
                    builders: {"hexcolor": HexColorBuilder()},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Note {
  String note;
  String id;
  DateTime date;

  // Constructor
  Note({
    required this.note,
    required this.id,
    required this.date,
  });
}

class FontColorSyntax extends md.InlineSyntax {
  FontColorSyntax()
      : super(
            r'''<span(?:.*?)data-color=['"]rgb *\((?: *([0-9]{1,3}))[, ]+(?: *([0-9]{1,3}))[, ]+(?: *([0-9]{1,3}))[, ]*\)['"](?:.*?)>(.*?)</span>''');

  @override
  bool onMatch(md.InlineParser parse, Match match) {
    md.Element colorTag =
        md.Element.text('fontcolor', match.group(4) ?? "matched text");

    colorTag.attributes["fontColorRed"] = match.group(1) ?? "0";
    colorTag.attributes["fontColorGreen"] = match.group(2) ?? "0";
    colorTag.attributes["fontColorBlue"] = match.group(3) ?? "0";

    parse.addNode(colorTag);
    return true;
  }
}

class FontColorBuilder extends MarkdownElementBuilder {
  int getColor(md.Element el, String color) =>
      int.tryParse(el.attributes["fontColor$color"] ?? "0") ?? 0;

  MarkdownStyleSheet getMyMarkdownStyleSheet(final TextStyle baseTextStyle) =>
      MarkdownStyleSheet(
        a: baseTextStyle.copyWith(color: Colors.blue),
        // Customize as needed
        p: baseTextStyle,
        code: baseTextStyle.copyWith(
          color: Colors.black,
          fontFamily: 'monospace', // Replace with a monospace font
          backgroundColor: Colors.grey[200],
        ),
        h1: baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold),
        h2: baseTextStyle.copyWith(fontSize: 22.0, fontWeight: FontWeight.bold),
        h3: baseTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
        h4: baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
        h5: baseTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
        h6: baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
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
  Widget visitElementAfter(element, style) {
    final red = getColor(element, "Red");
    final green = getColor(element, "Green");
    final blue = getColor(element, "Blue");

    final TextStyle baseTextStyle = GoogleFonts.robotoMono(
      color: Color.fromRGBO(red, green, blue, 1),
      fontWeight: FontWeight.normal,
    );

    return MarkdownBody(
        selectable: true,
        styleSheet: getMyMarkdownStyleSheet(baseTextStyle),
        data: element.textContent);
  }
}

class HexColorSyntax extends md.InlineSyntax {
  HexColorSyntax() : super(r'\[#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})\]\((.*?)\)');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final colorCode = match[1]!;
    final textContent = match[2]!;

    md.Element colorTag = md.Element.text('hexcolor', textContent);
    colorTag.attributes['colorCode'] = colorCode;

    parser.addNode(colorTag);
    return true;
  }
}

class HexColorBuilder extends MarkdownElementBuilder {
  MarkdownStyleSheet getMyMarkdownStyleSheet(final TextStyle baseTextStyle) =>
      MarkdownStyleSheet(
        a: baseTextStyle.copyWith(color: Colors.blue),
        // Customize as needed
        p: baseTextStyle,
        code: baseTextStyle.copyWith(
          color: Colors.black,
          fontFamily: 'monospace', // Replace with a monospace font
          backgroundColor: Colors.grey[200],
        ),
        h1: baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold),
        h2: baseTextStyle.copyWith(fontSize: 22.0, fontWeight: FontWeight.bold),
        h3: baseTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
        h4: baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
        h5: baseTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
        h6: baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
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
  Widget visitElementAfter(element, style) {
    final colorCode = element.attributes['colorCode'];

    int.parse(colorCode!, radix: 16);
    final TextStyle baseTextStyle = GoogleFonts.robotoMono(
      color: Color(int.parse(colorCode, radix: 16)),
      fontWeight: FontWeight.normal,
    );

    return MarkdownBody(
        selectable: true,
        styleSheet: getMyMarkdownStyleSheet(baseTextStyle),
        data: element.textContent);
  }
}


String formatDateTime(DateTime dateTime) {
  // Define the desired date format
  final DateFormat formatter = DateFormat.yMMMMd('en_US');

  // Format the DateTime using the defined format
  return formatter.format(dateTime);
}
