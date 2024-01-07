import "dart:math";

import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";
import "package:flutter_markdown/flutter_markdown.dart";
import "package:flutter_svg/svg.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:lottie/lottie.dart";

import "dart:math" as math;

import 'package:onelenykco/app/common/text_cloud.dart';
import "package:url_launcher/url_launcher.dart";

import "dart:html" as html;

import "../../../../common/hover_button.dart";
import "../../../../common/info_block.dart";
import "../../data/state/main_cubit.dart";

class ProfilePart extends StatelessWidget {

  ProfilePart({super.key});
  final getIt = GetIt.instance;

  Widget buildGreeting() => Column(
      children: [
        InfoBlock(
            child: SizedBox(
          width: 350,
          child: SelectableText.rich(
             TextSpan(
              style: GoogleFonts.robotoMono(fontSize: 16, color: Colors.white),
              children: const <TextSpan>[
                TextSpan(text: "👋 Hi there!"),
              ],
            ),
          ),
        ),),
        const SizedBox(
          height: 8,
        ),
        InfoBlock(
            child: SizedBox(
          width: 350,
          child: SelectableText.rich(
            TextSpan(
              style: GoogleFonts.robotoMono(fontSize: 16, color: Colors.white),
              children: const <TextSpan>[
                TextSpan(text: "👀 My name is "),
                TextSpan(
                  text: "Nazar Lenyk\n",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, ),
                ),
                TextSpan(text: "I love programming and implementing non-trivial things!\nEspecially i love "),
                TextSpan(
                  text: "Android",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0XFF3DDC84)),
                ),
                TextSpan(text: "."),

              ],
            ),
          ),
        ),),
        const SizedBox(
          height: 8,
        ),
        InfoBlock(
            child: SizedBox(
          width: 350,
          child: SelectableText.rich(
            TextSpan(
              style: GoogleFonts.robotoMono(fontSize: 16, color: Colors.white),
              children: const <TextSpan>[
                TextSpan(text: "Current technologies in use:↙️️️↙️️️↙️️"),
              ],
            ),
          ),
        ),),
      ],
    );

  Widget buildWordMap() => InfoBlock(
      child: Container(
          width: 350,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(width: 0, color: Colors.grey.shade900),
          ),
          child: const TextCloud(),),
    );

  Widget buildPart1() => Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildGreeting(),
            const SizedBox(
              height: 8,
            ),
          //  buildWordMap(),
            const SizedBox(
              width: 16,
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: HoverButton(
                    onTap: () {
                      openLink("https://onelenyk.t.me/");
                    },
                    onDoubleTap: () {},
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Lottie.asset(
                        //   'assets/fire.json',
                        //   width: 36,
                        //   height: 36,
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "telegram",
                            style: GoogleFonts.robotoMono(
                                fontSize: 18, color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: HoverButton(
                    onTap: () {
                      openLink("https://www.linkedin.com/in/onelenyk/");
                    },
                    onDoubleTap: () {},
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Lottie.asset(
                        //   'assets/fire.json',
                        //   width: 36,
                        //   height: 36,
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "linkedin",
                            style: GoogleFonts.robotoMono(
                                fontSize: 18, color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  bool randomBoolean() {
    var random = Random();
    // Generate a random integer and check if it's even or odd
    // If even, return true; if odd, return false
    return random.nextInt(2) == 0;
  }

  void openLink(final String url) {
    html.window.open(url, "_blank");
  }

  @override
  Widget build(final BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: buildPart1(),
    );
  }
}