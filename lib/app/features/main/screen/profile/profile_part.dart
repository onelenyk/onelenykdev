import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'dart:math' as math;

import 'package:onelenykco/app/common/text_cloud.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:html' as html;

import '../../../../common/hover_button.dart';
import '../../../../common/info_block.dart';
import '../../data/state/main_cubit.dart';

class ProfilePart extends StatelessWidget {
  final getIt = GetIt.instance;

  ProfilePart({super.key});

  Widget buildGreeting() {
    return Column(
      children: [
        InfoBlock(
            child: SizedBox(
          width: 350,
          child: SelectableText.rich(
             TextSpan(
              style: GoogleFonts.robotoMono(fontSize: 16, color: Colors.white),
              children: <TextSpan>[
                TextSpan(text: "👋 Hi there!"),
              ],
            ),
          ),
        )),
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
        )),
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
        )),
      ],
    );
  }

  Widget buildWordMap() {
    return InfoBlock(
      child: Container(
          width: 350,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            border: Border.all(width: 0.0, color: Colors.grey.shade900),
          ),
          child: TextCloud()),
    );
  }

  Widget buildPart1() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            buildGreeting(),
            SizedBox(
              height: 8,
            ),
            buildWordMap(),
            SizedBox(
              width: 16,
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12.0),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "telegram",
                            style: GoogleFonts.robotoMono(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12.0),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "linkedin",
                            style: GoogleFonts.robotoMono(
                                fontSize: 18, color: Colors.white),
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
  }

  bool randomBoolean() {
    var random = Random();
    // Generate a random integer and check if it's even or odd
    // If even, return true; if odd, return false
    return random.nextInt(2) == 0;
  }

  void openLink(String url) {
    html.window.open(url, '_blank');
  }

  void navigateToResume(){
    final cubit = getIt<MainCubit>();
    cubit.selectTopic(topic: resumeItem);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
// Printing the size to the console
    // print("SCREEN SIZES Width: ${screenSize.width}, Height: ${screenSize.height}");

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: buildPart1(),
    );
  }
}