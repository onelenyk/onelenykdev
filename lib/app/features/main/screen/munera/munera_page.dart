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


@RoutePage()
class MuneraScreen extends StatefulWidget {
  const MuneraScreen({super.key});

  @override
  State<MuneraScreen> createState() => _MuneraScreenState();
}

class _MuneraScreenState extends State<MuneraScreen> {
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
              ],
            ),
          ),
        ),
      );
}

