import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/hover_button.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/responsive_util.dart";
import "package:onelenykco/app/features/main/data/state/main_cubit.dart";
import "package:onelenykco/app/features/main/data/state/main_state.dart";
import "package:onelenykco/app/features/main/data/state/routes.dart";
import "package:onelenykco/app/features/main/screen/collaboration/collaboration.dart";
import "package:onelenykco/app/features/main/screen/design/design.dart";
import "package:onelenykco/app/features/main/screen/hireme/hire_me.dart";
import "package:onelenykco/app/features/main/screen/resume/resume_part.dart";
import "package:onelenykco/app/features/main/screen/site/site_part.dart";
import "package:onelenykco/app/root/app_router.dart";

import "../../../common/ui/powered_flutter.dart";
import "../data/blog/note.dart";
import "base/responsive_state.dart";
import "blog/blog_page.dart";

@RoutePage()
class CompositionScreen extends StatefulWidget {
  CompositionScreen({super.key});

  final getIt = GetIt.instance;
  late final MainCubit cubit = getIt<MainCubit>();

  @override
  _CompositionScreenState createState() => _CompositionScreenState(cubit);
}

class _CompositionScreenState
    extends ResponsiveState<CompositionScreen, MainState, MainCubit> {
  _CompositionScreenState(super.cubit);

  @override
  void onStateChange(
    final BuildContext context,
    final MainState state,
  ) {}

  @override
  Widget buildDesktopLayout(
    final BuildContext context,
    final MainState state,
  ) =>
      layout(state);

  @override
  Widget buildMobileLayout(
    final BuildContext context,
    final MainState state,
  ) =>
      layout(state);

  Widget bottomCareer({required final MainState state}) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
            child: Text(
              "career 💼",
              style: GoogleFonts.robotoMono(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          HoverButton(
            onTap: () {
              cubit.selectTopic(route: Routes.Resume);
            },
            onDoubleTap: () {},
            color: Colors.blueGrey.shade300,
            hoverColor: Colors.blueGrey.shade400,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                "resume 📓",
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          HoverButton(
            onTap: () {
              cubit.selectTopic(route: Routes.HireMe);
            },
            onDoubleTap: () {},
            color: Colors.blueGrey.shade300,
            hoverColor: Colors.blueGrey.shade400,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                "hire me 👀",
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          HoverButton(
            onTap: () {
              cubit.selectTopic(route: Routes.Collab);
            },
            onDoubleTap: () {},
            color: Color(0xFF2983B3),
            hoverColor: Color(0xFF7FB7D5),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                "collaboration 🌍",
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          HoverButton(
            onTap: () {
              final router = AutoRouter.of(context);
              router.navigate(const BlogRoute());
            },
            onDoubleTap: () {},
            color: Color(0xFFDA7054),
            hoverColor: Color(0xFFF8AF99),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                "blog",
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

        ],
      );

  Widget projects({required final MainState state}) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding:
        const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
        child: Text(
          "projects 🛠️",
          style: GoogleFonts.robotoMono(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      HoverButton(
        onTap: () {
          final router = AutoRouter.of(context);
          router.navigate(ProjectsRoute());
        },
        onDoubleTap: () {},
        color: Colors.yellow.shade600,
        hoverColor: Colors.yellow.shade400,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            "timeline",
            style: GoogleFonts.robotoMono(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      HoverButton(
        onTap: () {
          final router = AutoRouter.of(context);
          router.navigate(MuneraRoute());
        },
        onDoubleTap: () {},
        color: Colors.redAccent,
        hoverColor: Colors.redAccent.shade100,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            "munera",
            style: GoogleFonts.robotoMono(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );

  Widget munera({required final MainState state}) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
            child: Text(
              "service 📺",
              style: GoogleFonts.robotoMono(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          HoverButton(
            onTap: () {
              final router = AutoRouter.of(context);
              router.navigate(MuneraRoute());
            },
            onDoubleTap: () {},
            color: Colors.redAccent,
            hoverColor: Colors.redAccent.shade100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                "munera",
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );

  Widget site({required final MainState state}) => HoverButton(
        onTap: () {
          cubit.selectTopic(route: Routes.AboutSite);
        },
        onDoubleTap: () {},
        color: Colors.grey.shade900,
        hoverColor: Colors.grey.shade500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            "${state.version}",
            style: GoogleFonts.robotoMono(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget design({required final MainState state}) => HoverButton(
        onTap: () {
          cubit.selectTopic(route: Routes.Design);
        },
        onDoubleTap: () {},
        color: Colors.deepPurple.shade300.withAlpha(97),
        hoverColor: Colors.deepPurple.shade200.withAlpha(99),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            Routes.Design.title,
            style: GoogleFonts.robotoMono(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget buildBody({required final MainState state}) {
    Widget? content;

    switch (state.activeRoute) {
      case Routes.Collab:
        content = CollaborationPart();
        break;
      case Routes.Resume:
        content = ResumePart();
        break;
      case Routes.HireMe:
        content = const HireMePart();
        break;
      case Routes.Blog:
        content = const Placeholder();
        break;
      case Routes.AboutSite:
        content = const SiteStoryPart();
        break;
      case Routes.Design:
        content = const DesignPart();

        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF343540),
        borderRadius: BorderRadius.circular(0),
      ),
      child: content,
    );
  }

  Widget buildMenu(final MainState state) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: HoverButton(
                    hoverColor: Colors.blueGrey.shade300.withAlpha(100),
                    color: Colors.blueGrey.shade300.withOpacity(0.95),
                    onTap: cubit.openMenu,
                    onDoubleTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        FontAwesomeIcons.bars,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: HoverButton(
                    hoverColor: Colors.blueGrey.shade300.withAlpha(100),
                    color: Colors.blueGrey.shade300.withOpacity(0.95),
                    onTap: cubit.openMenu,
                    onDoubleTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        state.activeRoute.title,
                        style: GoogleFonts.robotoMono(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: state.isMenuOpened,
              child: InfoBlock(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoBlock(
                      color: Colors.blueGrey.shade300.withOpacity(0.90),
                      child: bottomCareer(state: state),
                    ),
                    const SizedBox(height: 8),
                    InfoBlock(
                      color: Colors.yellow.shade600.withOpacity(0.90),
                      child: projects(state: state),
                    ),
                    const SizedBox(height: 8),
                    site(state: state),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget layout(final MainState state) => Scaffold(
        body: SelectionArea(
          child: Stack(
            children: [
              buildBody(state: state),
              buildMenu(state),
            ],
          ),
        ),
      );
}
