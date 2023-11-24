import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onelenykco/app/common/hover_button.dart';
import 'package:onelenykco/app/common/info_block.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
/*

class HireMePart extends StatelessWidget {
  const HireMePart({super.key});

  Widget topicPostItem(String text, VoidCallback onTap) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    final List<String> items = [
      "test",
      "test2",
      "test3",
      "test3",
      "test4",
      "test45"
    ];
    return SizedBox(
      width: 400,
      height: 400,
      child: GridView.builder(
        // Define the grid delegate
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 items per row
          crossAxisSpacing: 4.0, // Horizontal space between items
          mainAxisSpacing: 4.0, // Vertical space between items
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];

          return Column(
            children: [
              Text(item),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: buildBody(context),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/link_utils.dart';

class SiteStoryPart extends StatefulWidget {
  @override
  _SiteStoryPartState createState() => _SiteStoryPartState();
}

class _SiteStoryPartState extends State<SiteStoryPart> {
  String appVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    loadVersion();
  }

  Future<void> loadVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;

      setState(() {
        appVersion = "$version+$buildNumber";
      });
    } catch (e) {
      print('Error loading version: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoBlock(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      "the site story"),
                )),
            SizedBox(
              height: 8,
            ),
            InfoBlock(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      "current version: $appVersion"),
                )),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
