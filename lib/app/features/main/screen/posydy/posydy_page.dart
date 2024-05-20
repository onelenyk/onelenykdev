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
class PosydyScreen extends StatefulWidget {
  const PosydyScreen({super.key});

  @override
  State<PosydyScreen> createState() => _PosydyScreenState();
}

class _PosydyScreenState extends State<PosydyScreen> {
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
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
