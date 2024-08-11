import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykdev/app/features/main/screen/base/mobile_frame.dart";

import "../../../../common/hover_button.dart";
import "../../../../common/info_block.dart";
import "../../../../root/app_router.dart";
import "../../data/state/main_cubit.dart";
import "../../data/state/main_state.dart";
import "../../data/state/routes.dart";
import "../base/responsive_state.dart";

@RoutePage()
class ContactsScreen extends StatefulWidget {
  ContactsScreen({super.key});

  final getIt = GetIt.instance;
  late final MainCubit cubit = getIt<MainCubit>();

  @override
  _ContactsScreenState createState() => _ContactsScreenState(cubit);
}

class _ContactsScreenState
    extends ResponsiveState<ContactsScreen, MainState, MainCubit> {
  _ContactsScreenState(super.cubit);

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final MainState state) =>
      buildMenu(state);

  @override
  Widget buildMobileLayout(final BuildContext context, final MainState state) =>
      buildMenu(state);

  Widget bottomCareer({required final MainState state}) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          final router = AutoRouter.of(context);
          router.navigate(const SiteStoryRoute());
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

  Widget buildMenu(final MainState state) => MobileFrame(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HoverButton(
                    onTap: () {
                      final router = AutoRouter.of(context);
                      router.navigate(const HireMeRoute());
                    },
                    onDoubleTap: () {},
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                  ),
                  const SizedBox(height: 8),
                  HoverButton(
                    onTap: () {
                      final router = AutoRouter.of(context);
                      router.navigate(CollaborationRoute());
                    },
                    onDoubleTap: () {},
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                  ),
                  const SizedBox(height: 8),
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(width: 50, child: Divider())),
                  const SizedBox(height: 8),
                  HoverButton(
                    onTap: () {
                      final router = AutoRouter.of(context);
                      router.navigate(const BlogRoute());
                    },
                    onDoubleTap: () {},
                    color: Color(0xFFDA7054),
                    hoverColor: Color(0xFFF8AF99),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                site(state: state),
              ],
            ),
          ],
        ),
      );
}
