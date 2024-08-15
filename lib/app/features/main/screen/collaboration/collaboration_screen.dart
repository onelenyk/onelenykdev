import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykdev/app/common/hover_button.dart";
import "package:onelenykdev/app/common/info_block.dart";
import "package:onelenykdev/app/common/link_utils.dart";
import "package:url_launcher/url_launcher.dart";
import "../../data/blog/note.dart";
import "../../data/resume/resume_cubit.dart";
import "../../data/resume/resume_state.dart";
import "../base/responsive_state.dart";
import "../blog/blog_page.dart";
import "../design/design.dart";
import "../hireme/hire_me_screen.dart";

@RoutePage()
class CollaborationScreen extends StatefulWidget {
  CollaborationScreen({super.key});

  final getIt = GetIt.instance;
  late final ResumeCubit cubit = getIt.get<ResumeCubit>();

  @override
  _CollaborationScreenState createState() => _CollaborationScreenState(cubit);
}

class _CollaborationScreenState
    extends ResponsiveState<CollaborationScreen, ResumeState, ResumeCubit> {
  _CollaborationScreenState(super.cubit);


  Widget buildLayout(final BuildContext context, ResumeState state) {
    final Note resumeabout = Note(
      note: """
I have experience working with a variety of technologies including : native android, flutter(at least web), ktor(http server), telegram bots(using kotlin), ffmpeg (some video/audio experience).\n\n
I am eager to collaborate and create.\n\n
Here are some ways we can work together: 
  """,
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
                padding: const EdgeInsets.symmetric(horizontal: 8),

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
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: buildContacts(
                  telegram: () {
                    openLink("https://onelenyk.t.me/");
                  },
                  linkedin: () {
                    openLink("https://www.linkedin.com/in/onelenyk/");
                  },
                  instagram: () => {
                    openLink(
                        "https://www.instagram.com/makemegreatagain.pleasure/"),
                  },
                  github: () {
                    openLink("https://github.com/onelenyk/");
                  },
                  resume: () {
                    downloadPdfFromAssets(
                      "assets/resume.pdf",
                    );
                  },
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
