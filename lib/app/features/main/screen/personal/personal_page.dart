import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/data/firebase/auth/auth_state.dart";
import "package:onelenykco/app/features/main/screen/login/login_part.dart";
import "package:onelenykco/app/features/main/screen/personal/personal_cubit.dart";
import "package:onelenykco/app/features/main/screen/personal/personal_state.dart";
import "package:onelenykco/app/features/main/screen/personal/scenario/scenario_state.dart";

import "../../../../common/hover_button.dart";
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

  const BadgeContainer({required this.child, required this.badgeText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          child,
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
}

class _PersonalScreenState
    extends ResponsiveState<PersonalScreen, PersonalState, PersonalCubit> {
  _PersonalScreenState(super.cubit);

  Widget buildLogin(final PersonalState state, final MainState scenario) {
    var hello = <TextSpan>[
      TextSpan(
        text: "Hello there, ",
        style: GoogleFonts.vt323(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            letterSpacing: 2),
      ),
      TextSpan(
        text: "${scenario.user?.email}",
        style: GoogleFonts.vt323(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
            letterSpacing: 2),
      ),
    ];

    var loggedIn = (state.activeScenario as MainState).user != null;
    if (loggedIn) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                      padding:
                          const EdgeInsets.only(top: 32, left: 16, right: 16),
                      child: SelectableText.rich(
                        TextSpan(
                          style: GoogleFonts.robotoMono(
                              fontSize: 16, color: Colors.white),
                          children: hello,
                        ),
                      ),
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
                                style: GoogleFonts.vt323(
                                    fontSize: 16,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0),
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
                    padding:
                        const EdgeInsets.only(top: 32, left: 16, right: 16),
                    child: SelectableText.rich(
                      TextSpan(
                        text: "The task for today:",
                        style: GoogleFonts.vt323(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom:16),
                    child: SelectableText.rich(
                      TextSpan(
                        text: "tap the button",
                        style: GoogleFonts.vt323(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2),
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
                            style: GoogleFonts.vt323(
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
            badgeText: "3",
            child: InfoBlock(
              padding: const EdgeInsets.only(
                  top: 32, left: 16, right: 16, bottom: 16),
              width: 350,
              child: LoginPart(),
            ),
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
                              fontSize: 16, color: Colors.white),
                          children: hello,
                        ),
                      ),
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
                                style: GoogleFonts.vt323(
                                    fontSize: 16,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0),
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
}

class TypingAnimation extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    final animation =
        Tween<double>(begin: 0, end: 1).animate(animationController);

    return Wrap(
      spacing: 1,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: List.generate(3, (index) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Interval(index * 0.2, 1.0, curve: Curves.easeInOut),
          ),
          child: const TextDot(),
        );
      }),
    );
  }
}

class TextDot extends StatelessWidget {
  const TextDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: ".",
        style: GoogleFonts.vt323(
            fontSize: 16, color: Colors.white70, fontWeight: FontWeight.normal),
      ),
    );

    return Text(
      '.',
      style: GoogleFonts.vt323(
        fontSize: 16,
        color: Colors.white70,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
