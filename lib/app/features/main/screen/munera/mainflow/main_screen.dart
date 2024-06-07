import "package:auto_route/annotations.dart";
import 'package:flutter/material.dart';
import "package:get_it/get_it.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:onelenykco/app/features/main/screen/base/base_screen.dart";

import "../../../../../common/hover_button.dart";
import "../../../../../common/info_block.dart";
import "../../../../../data/user/user_payload.dart";
import "../../base/responsive_state.dart";
import "../../login/login_part.dart";
import "../personal_cubit.dart";
import "../munera_screen.dart";
import "../personal_state.dart";
import "../utils/badge_container.dart";

@RoutePage()
class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  final getIt = GetIt.instance;
  late final PersonalCubit cubit = getIt<PersonalCubit>();

  @override
  _MainScreenState createState() => _MainScreenState(cubit);
}

class _MainScreenState
    extends ResponsiveState<MainScreen, PersonalState, PersonalCubit> {
  _MainScreenState(super.cubit);

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final PersonalState state) =>
      layout(state);

  @override
  Widget buildMobileLayout(
          final BuildContext context, final PersonalState state) =>
      layout(state);

  Widget layout(final PersonalState state) {
    final payload = state.activeScenario.payload;
    final formattedDate = payload == null
        ? ""
        : payload.taps.lastOrNull?.formattedDate ?? "empty";
    final taps = payload?.taps.reversed.toList();

    final hello = <TextSpan>[
      TextSpan(
        text: "Hello there, ",
        style: GoogleFonts.robotoMono(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            letterSpacing: 2),
      ),
      TextSpan(
        text: state.activeScenario.login,
        style: GoogleFonts.robotoMono(
            fontSize: 14,
            color: Colors.red,
            fontWeight: FontWeight.bold,
            letterSpacing: 2),
      ),
    ];

    return Column(
      children: [
        BadgeContainer(
            badgeText: "1",
            showBadge: true,
            child: InfoBlock(
              width: double.maxFinite,
              padding: const EdgeInsets.all(8.0),
              child: buildSelectableText(hello),
            )),
        const SizedBox(height: 16),
        BadgeContainer(
            badgeText: "2",
            child: InfoBlock(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildTaskText(),
                  buildLastTapText(formattedDate),
                  buildTapButton(state.isLoading),
                ],
              ),
            ),
            showBadge: true),
      ],
    );
  }

  Widget buildBadgeContainer(
          final String badgeText, final Widget child, final bool showBadge) =>
      BadgeContainer(badgeText: badgeText, showBadge: showBadge, child: child);

  Widget buildSelectableText(final List<TextSpan> hello) => Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: SelectableText.rich(
          TextSpan(
            style: GoogleFonts.robotoMono(fontSize: 14, color: Colors.white),
            children: hello,
          ),
        ),
      );

  Widget buildTaskText() => Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: SelectableText.rich(
          TextSpan(
            style: GoogleFonts.robotoMono(fontSize: 14, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: "The task for today: ",
                style: GoogleFonts.robotoMono(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2),
              ),
              TextSpan(
                text: "tap the button",
                style: GoogleFonts.robotoMono(
                    fontSize: 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2),
              ),
            ],
          ),
        ),
      );

  Widget buildLastTapText(final String formattedDate) => Padding(
        padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
        child: SelectableText.rich(
          TextSpan(
            style: GoogleFonts.robotoMono(fontSize: 14, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: "Last tap date: ",
                style: GoogleFonts.robotoMono(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2),
              ),
              TextSpan(
                text: formattedDate,
                style: GoogleFonts.robotoMono(
                    fontSize: 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2),
              ),
            ],
          ),
        ),
      );

  Widget buildTapButton(final bool loading) {
    final SizedBox content;

    if (loading) {
      content = const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      );
    } else {
      content = SizedBox(
          height: 20,
          child: Text(
            "tap",
            style: GoogleFonts.robotoMono(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ));
    }

    return HoverButton(
      onTap: cubit.tapButton,
      onDoubleTap: () {},
      hoverColor: Colors.black26,
      color: Colors.black26,
      clickable: !loading,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: content,
        ),
      ),
    );
  }

  Widget buildTapHistory(final List<Tap> taps) => BadgeContainer(
        badgeText: "3",
        child: InfoBlock(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoBlock(
                width: 350,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "The history of taps:",
                          style: GoogleFonts.robotoMono(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 500),
                      child: taps.isNotEmpty
                          ? SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: taps
                                    .asMap()
                                    .entries
                                    .map((final entry) => buildTapItem(
                                        entry.value,
                                        entry.value.id == taps.first.id))
                                    .toList(),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildTapItem(final Tap item, final bool last) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: InfoBlock(
          color: Colors.black12,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    item.id,
                    style: GoogleFonts.robotoMono(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    item.formattedDate,
                    style: GoogleFonts.robotoMono(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (last)
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.black26.withAlpha(20),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white24,
                        ),
                      ),
                      child: Text(
                        "latest",
                        style: GoogleFonts.robotoMono(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
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
