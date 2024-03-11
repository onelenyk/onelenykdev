import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_markdown/flutter_markdown.dart";
import "package:flutter_svg/svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:markdown/markdown.dart" as md;
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/link_utils.dart";
import "package:onelenykco/app/features/main/data/blog/note.dart";
import "package:onelenykco/app/features/main/screen/blog/post_site.dart";
import "package:onelenykco/app/features/main/screen/blog/post_template.dart";

import "markdown/hex_color_builder.dart";
import "markdown/hex_color_syntax.dart";

@RoutePage()
class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final List<Note> notes = [
    site,
    template
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Container(
          color: Colors.grey.shade900,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InfoBlock(
                    color: Colors.deepOrange.shade200.withOpacity(0.4),
                    width: 800,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "create, explore, expand, conquer",
                            style: GoogleFonts.robotoMono(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            //     overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
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
          ),
        ),
      );
}

class MyPostWidget extends StatefulWidget {
  const MyPostWidget({
    required this.note,
    super.key,
    this.post = true,
  });

  final Note note;

  final bool post;

  @override
  _MyPostWidgetState createState() => _MyPostWidgetState();
}

class _MyPostWidgetState extends State<MyPostWidget> {
  bool showMore = false;

  final TextStyle baseTextStyle = GoogleFonts.robotoMono(
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );

  String cutText(final String text, final int limit) {
    if (text.length <= limit) {
      return text; // No need to cut if the text is within the limit
    }

    // Find the last space within the limit
    final lastSpaceIndex = text.lastIndexOf(" ", limit);

    // If there is no space within the limit, cut at the limit
    if (lastSpaceIndex == -1) {
      return text.substring(0, limit);
    }

    // Otherwise, cut at the last space within the limit
    return text.substring(0, lastSpaceIndex);
  }

  String shortenName(
    final String nameRaw, {
    final int nameLimit = 10,
    final bool addDots = false,
  }) {
    //* Limiting val should not be gt input length (.substring range issue)
    final max = nameLimit < nameRaw.length ? nameLimit : nameRaw.length;
    //* Get short name
    final name = cutText(nameRaw, max);
    //* Return with '..' if input string was sliced
    if (addDots && nameRaw.length > max) {
      return """$name\n[...read more](/more)""";
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
          fontFamily: "monospace", // Replace with a monospace font
          backgroundColor: Colors.grey[200],
        ),
        h1: baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.normal),
        h2: baseTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.normal),
        h3: baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
        h4: baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.normal),
        h5: baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.normal),
        h6: baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.normal),
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

  String formatDateTime(final DateTime dateTime) {
    // Define the desired date format
    final formatter = DateFormat.yMMMMd("en_US");

    // Format the DateTime using the defined format
    return formatter.format(dateTime);
  }

  @override
  Widget build(final BuildContext context) {
    if (!widget.post) {
      return Markdown(
        styleSheet: getMyMarkdownStyleSheet(baseTextStyle),
        onTapLink: (final text, final href, final title) {
          if (href == "/more" || href == "/less") {
            setState(() {
              showMore = !showMore;
            });
          } else {
            openLink(href ?? "");
          }
        },
        data: widget.note.note,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        selectable: true,
        inlineSyntaxes: [HexColorSyntax()],
        builders: {"hexcolor": HexColorBuilder()},
        physics: const NeverScrollableScrollPhysics(),
      );
    }

    String data;
    if (!showMore) {
      data = shortenName(widget.note.note, nameLimit: 280, addDots: true);
    } else {
      data = """${widget.note.note}\n[...less](/less)""";
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: InfoBlock(
              width: 800,
              color: Colors.deepOrange.shade300,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.deepOrange.shade200,
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: SvgPicture.asset(
                            "assets/svg/head.svg",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                    onTapLink: (final text, final href, final title) {
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
                    padding: const EdgeInsets.all(8),
                    selectable: true,
                    inlineSyntaxes: [HexColorSyntax()],
                    builders: {"hexcolor": HexColorBuilder()},
                    physics: const NeverScrollableScrollPhysics(),
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
