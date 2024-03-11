import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/hover_button.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/link_utils.dart";
import "package:url_launcher/url_launcher.dart";
import "../../data/blog/note.dart";
import "../../data/resume/resume_cubit.dart";
import "../../data/resume/resume_state.dart";
import "../base/responsive_state.dart";
import "../blog/blog_page.dart";
import "../design/design.dart";

class CollaborationPart extends StatefulWidget {
  CollaborationPart({super.key});

  final getIt = GetIt.instance;
  late final ResumeCubit cubit = getIt.get<ResumeCubit>();

  @override
  _CollaborationPartState createState() => _CollaborationPartState(cubit);
}

class _CollaborationPartState
    extends ResponsiveState<CollaborationPart, ResumeState, ResumeCubit> {
  _CollaborationPartState(super.cubit);

  Widget buildNewContactMe({
    required Function() telegram,
    required Function() linkedin,
    required Function() instagram,
    required Function() github,
    required Function() resume,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Row(
            children: [
              Text(
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                "tg",
              ),
              const SizedBox(
                width: 8,
              ),
              CircleButton(
                size: 30,
                hoverColor: Colors.grey,
                rippleColor: Colors.grey,
                backgroundColor: Colors.transparent,
                onTap: telegram,
                child: const Icon(
                  Icons.telegram_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Row(
            children: [
              Text(
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                "link",
              ),
              const SizedBox(
                width: 8,
              ),
              CircleButton(
                size: 30,
                hoverColor: Colors.grey,
                rippleColor: Colors.grey,
                backgroundColor: Colors.transparent,
                onTap: () {
                  print('Circle Button Clicked!');
                },
                child: const Icon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Row(
            children: [
              Text(
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                "inst",
              ),
              const SizedBox(
                width: 8,
              ),
              CircleButton(
                size: 30,
                hoverColor: Colors.grey,
                rippleColor: Colors.grey,
                backgroundColor: Colors.transparent,
                onTap: () {
                  print('Circle Button Clicked!');
                },
                child: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Row(
            children: [
              Text(
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                "git",
              ),
              const SizedBox(
                width: 8,
              ),
              CircleButton(
                size: 30,
                hoverColor: Colors.grey,
                rippleColor: Colors.grey,
                backgroundColor: Colors.transparent,
                onTap: () {
                  print('Circle Button Clicked!');
                },
                child: const Icon(
                  FontAwesomeIcons.githubAlt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLayout(final BuildContext context, ResumeState state) {
    final Note resumeabout = Note(
      note: " I have experience with a range of technologies including Android, Flutter, Ktor, Telegram bots, FFmpeg, Kotlin, Java, and Gradle. I'm enthusiastic about collaborating and exploring new opportunities. Here are some ways we can work together:",
      id: "resume",
      date: DateTime.parse("2024-04-10"),
    );

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InfoBlock(
                color: Colors.grey.shade800,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SelectableText.rich(
                    TextSpan(
                      style: GoogleFonts.robotoMono(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "let's collaborate 🌍",
                          style: GoogleFonts.robotoMono(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InfoBlock(
                width: 350,
                child: Column(
                  children: [
                    MyPostWidget(
                      note: resumeabout,
                      post: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InfoBlock(
                width: 350,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildNewContactMe(
                      telegram: () {},
                      linkedin: () {},
                      instagram: () {},
                      github: () {},
                      resume: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildDesktopLayout(BuildContext context, ResumeState state) {
    return buildLayout(context, state);
  }

  @override
  Widget buildMobileLayout(BuildContext context, ResumeState state) {
    return buildLayout(context, state);
  }
}
