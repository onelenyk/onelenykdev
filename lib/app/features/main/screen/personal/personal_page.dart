import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/features/main/screen/login/login_part.dart";
import "package:onelenykco/app/features/main/screen/personal/personal_cubit.dart";
import "package:onelenykco/app/features/main/screen/personal/personal_state.dart";
import "package:onelenykco/app/features/main/screen/personal/scenario/scenario_state.dart";

import "../../../../common/hover_button.dart";
import "../../../../data/user/user_payload.dart";
import "../base/responsive_state.dart";

@RoutePage()
class PersonalScreen extends StatefulWidget {
  PersonalScreen({super.key});

  final getIt = GetIt.instance;
  late final PersonalCubit cubit = getIt<PersonalCubit>();

  @override
  _PersonalScreenState createState() => _PersonalScreenState(cubit);
}

class BadgeContainer extends StatelessWidget {
  final Widget child;
  final String badgeText;
  final bool showBadge;

  const BadgeContainer(
      {required this.child,
      required this.badgeText,
      final Key? key,
      this.showBadge = true})
      : super(key: key);

  @override
  Widget build(final BuildContext context) => Container(
      child: Stack(
        children: [
          child,
          if (showBadge)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 30,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    badgeText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
}

/*
class _PersonalScreenState
    extends ResponsiveState<PersonalScreen, PersonalState, PersonalCubit> {
  _PersonalScreenState(super.cubit);

  Widget buildLogin(final PersonalState state, final MainState scenario) {
    var hello = <TextSpan>[
      TextSpan(
        text: "Hello there, ",
        style: GoogleFonts.robotoMono(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            letterSpacing: 2),
      ),
      TextSpan(
        text: "${scenario.user?.email}",
        style: GoogleFonts.robotoMono(
            fontSize: 14,
            color: Colors.red,
            fontWeight: FontWeight.bold,
            letterSpacing: 2),
      ),
    ];

    final loggedIn = (state.activeScenario as MainState).user != null;

    final payload = state.activeScenario.payload;
    final formattedFate = payload == null
        ? ""
        : formatDateTime(
            payload.taps.lastOrNull?.tapDate?.toDate() ?? DateTime.now());

    if (loggedIn) {
      final taps = payload!.taps.reversed!;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                children: [
                  BadgeContainer(
                    badgeText: "1",
                    child: InfoBlock(
                        padding: const EdgeInsets.all(8.0),
                        width: 350,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 32, left: 16, right: 16),
                              child: SelectableText.rich(
                                TextSpan(
                                  style: GoogleFonts.robotoMono(
                                      fontSize: 14, color: Colors.white),
                                  children: hello,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 16, right: 16, bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (scenario.user == null)
                                    SelectableText.rich(
                                      TextSpan(
                                        text: "it seems you need to login ",
                                        style: GoogleFonts.robotoMono(
                                          fontSize: 14,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  TypingAnimation()
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BadgeContainer(
                    badgeText: "2",
                    child: InfoBlock(
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 8),
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32, left: 16, right: 16),
                            child: SelectableText.rich(
                              TextSpan(
                                style: GoogleFonts.robotoMono(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 16, right: 16, bottom: 16),
                            child: SelectableText.rich(
                              TextSpan(
                                style: GoogleFonts.robotoMono(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
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
                                    text: formattedFate,
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 14,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          HoverButton(
                            onTap: cubit.tapButton,
                            onDoubleTap: () {},
                            hoverColor: Colors.black26,
                            clickable: true,
                            color: Colors.black.withAlpha(30),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: SizedBox(
                                  height: 20,
                                  child: Text(
                                    "tap",
                                    style: GoogleFonts.robotoMono(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BadgeContainer(
                    badgeText: "4",
                    child: InfoBlock(
                      padding: const EdgeInsets.only(
                          top: 32, left: 16, right: 16, bottom: 16),
                      width: 350,
                      child: LoginPart(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                child: BadgeContainer(
                  badgeText: "3",
                  child: InfoBlock(
                    padding: const EdgeInsets.only(
                        top: 8, left: 8, right: 8, bottom: 8),
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
                              const SizedBox(
                                height: 16,
                              ),
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
                              const SizedBox(
                                height: 16,
                              ),
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxHeight: 500),
                                child: taps.isNotEmpty
                                    ? SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: taps
                                              .map(
                                                (final item) => Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              item.id,
                                                              style: GoogleFonts
                                                                  .robotoMono(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                            Text(
                                                              item.formattedDate,
                                                              style: GoogleFonts
                                                                  .robotoMono(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 16,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "latest",
                                                              style: GoogleFonts
                                                                  .robotoMono(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator()),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      );
    } else {
      return BadgeContainer(
        badgeText: "1",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InfoBlock(
              width: 350,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 32, left: 16, right: 16),
                      child: SelectableText.rich(
                        TextSpan(
                          style: GoogleFonts.robotoMono(
                              fontSize: 14, color: Colors.white),
                          children: hello,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 16, right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (scenario.user == null)
                            SelectableText.rich(
                              TextSpan(
                                text: "it seems you need to login ",
                                style: GoogleFonts.robotoMono(
                                  fontSize: 14,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          TypingAnimation()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, left: 16, right: 16, bottom: 16),
                      child: LoginPart(),
                    ),
                  ],
                ),
              )),
        ),
      );
    }
  }

  Widget buildMain(final PersonalState state, final MainState scenario) =>
      BadgeContainer(
        badgeText: "2",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Placeholder(),
        ),
      );

  Widget buildBody({required final PersonalState state}) {
    Widget? content;

    if (state.activeScenario is MainState) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLogin(state, state.activeScenario as MainState),
          // buildMain(state, state.activeScenario as MainState)
        ],
      );
    } else {
      content = Placeholder();
    }

    return content;
  }

  Widget layout(final PersonalState state) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF343540),
            borderRadius: BorderRadius.circular(0),
          ),
          child: Center(
            child: buildBody(state: state),
          ),
        ),
      );

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final PersonalState state) =>
      layout(state);

  @override
  Widget buildMobileLayout(
          final BuildContext context, final PersonalState state) =>
      layout(state);

  String formatDateTime(final DateTime dateTime) {
    // Define the desired date format
    final formatter = DateFormat.yMMMMd("en_US").add_Hm();

    // Format the DateTime using the defined format
    return formatter.format(dateTime);
  }
}
*/

class _PersonalScreenState
    extends ResponsiveState<PersonalScreen, PersonalState, PersonalCubit> {
  _PersonalScreenState(super.cubit);

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final PersonalState state) =>
      layout(state);

  @override
  Widget buildMobileLayout(
          final BuildContext context, final PersonalState state) =>
      layout(state);

  Widget layout(final PersonalState state) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF343540),
            borderRadius: BorderRadius.circular(0),
          ),
          child: Center(
            child: buildBody(state: state),
          ),
        ),
      );

  Widget buildBody({required final PersonalState state}) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildLogin(state, state.activeScenario),
      ],
    );

  String getLocalPartOfEmail(final String email) {
    // Check if the email contains '@' symbol
    if (email.contains('@')) {
      // Split the email by '@' and return the first part
      return email.split('@')[0];
    } else {
      // If email does not contain '@', return an empty string or handle as needed
      return '';
    }
  }

  Widget buildLogin(final PersonalState state, final ScenarioState scenario) {
    final user = scenario.user;
    final payload = scenario.payload;
    final loggedIn = user != null;

    String login = getLocalPartOfEmail(user?.email ?? "");

    var hello = <TextSpan>[
      TextSpan(
        text: "Hello there, ",
        style: GoogleFonts.robotoMono(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            letterSpacing: 2),
      ),
      TextSpan(
        text: login,
        style: GoogleFonts.robotoMono(
            fontSize: 14,
            color: Colors.red,
            fontWeight: FontWeight.bold,
            letterSpacing: 2),
      ),
    ];

    final formattedDate = payload == null
        ? ""
        : payload.taps.lastOrNull?.formattedDate ?? "empty";

    if (loggedIn) {
      final taps = payload!.taps.reversed.toList();
      return buildLoggedInContent(hello, formattedDate, taps, state.isLoading);
    } else {
      return buildLoginPrompt(hello);
    }
  }

  Widget buildLoggedInContent(final List<TextSpan> hello,
      final String formattedDate, final List<Tap> taps, final bool loading) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          children: [
            Column(
              children: [
                buildBadgeContainer(
                  "0",
                  InfoBlock(
                    padding: const EdgeInsets.all(8.0),
                    width: 350,

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSelectableText([
                          TextSpan(
                            text: "personal.",
                            style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 2),
                          ),
                        ]),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  false
                ),
                SizedBox(height: 16),
                buildBadgeContainer(
                  "1",
                  InfoBlock(
                    padding: const EdgeInsets.all(8.0),
                    width: 350,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSelectableText(hello),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                    true

                ),
                SizedBox(height: 16),
                buildBadgeContainer(
                  "2",
                  InfoBlock(
                    padding: const EdgeInsets.only(
                        top: 8, left: 8, right: 8, bottom: 8),
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTaskText(),
                        buildLastTapText(formattedDate),
                        buildTapButton(loading),
                      ],
                    ),
                  ),
                    true

                ),
                SizedBox(height: 16),
                buildBadgeContainer(
                  "4",
                  InfoBlock(
                    padding: const EdgeInsets.only(
                        top: 32, left: 16, right: 16, bottom: 16),
                    width: 350,
                    child: LoginPart(),
                  ),
                  true
                ),
              ],
            ),
            SizedBox(width: 16),
            buildTapHistory(taps),
          ],
        ),
      ],
    );

  Widget buildBadgeContainer(
      final String badgeText, final Widget child, final bool showBadge) => BadgeContainer(
        badgeText: badgeText, child: child, showBadge: showBadge);

  Widget buildSelectableText(final List<TextSpan> hello) => Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
      child: SelectableText.rich(
        TextSpan(
          style: GoogleFonts.robotoMono(fontSize: 14, color: Colors.white),
          children: hello,
        ),
      ),
    );

  Widget buildLoginPromptText() => Padding(
      padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SelectableText.rich(
            TextSpan(
              text: "it seems you need to login ",
              style: GoogleFonts.robotoMono(
                fontSize: 14,
                color: Colors.white70,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          TypingAnimation(),
        ],
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
      content = SizedBox(
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
        padding: EdgeInsets.all(8),
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
                      padding: EdgeInsets.all(4.0),
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

  Widget buildLoginPrompt(final List<TextSpan> hello) => BadgeContainer(
      badgeText: "1",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InfoBlock(
          width: 350,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                  child: SelectableText.rich(
                    TextSpan(
                      style: GoogleFonts.robotoMono(
                          fontSize: 14, color: Colors.white),
                      children: hello,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                buildLoginPromptText(),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: 16),
                  child: LoginPart(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
}

class TypingAnimation extends HookWidget {
  @override
  Widget build(final BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    final animation =
        Tween<double>(begin: 0, end: 1).animate(animationController);

    return Wrap(
      spacing: 1,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: List.generate(3, (final index) => FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Interval(index * 0.2, 1.0, curve: Curves.easeInOut),
          ),
          child: const TextDot(),
        )),
    );
  }
}

class TextDot extends StatelessWidget {
  const TextDot({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => SelectableText.rich(
      TextSpan(
        text: ".",
        style: GoogleFonts.robotoMono(
            fontSize: 14, color: Colors.white70, fontWeight: FontWeight.normal),
      ),
    );
}
