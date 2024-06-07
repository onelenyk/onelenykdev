import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/features/main/screen/base/responsive_state.dart";
import "package:onelenykco/app/features/main/screen/login/login_part.dart";

import "../../../../../data/firebase/auth/auth_state.dart";
import "../../../../../data/firebase/auth_cubit.dart";
import "../../../../../root/app_router.dart";
import "../../base/base_screen.dart";
import "../personal_cubit.dart";
import "../utils/badge_container.dart";
import "../utils/typing_widget.dart";

@RoutePage()
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  final getIt = GetIt.instance;
  late final PersonalCubit cubit = getIt<PersonalCubit>();
  late final AuthenticationCubit authCubit = getIt<AuthenticationCubit>();

  @override
  _LoginScreenState createState() => _LoginScreenState(authCubit);
}

class _LoginScreenState
    extends ResponsiveState<LoginScreen, AuthState, AuthenticationCubit> {
  _LoginScreenState(super.cubit);

  @override
  Future<void> onStateChange(
    final BuildContext context,
    final AuthState state,
  ) async {
    if (state is AuthSuccess) {
      await context.router.replace(MainContainerRoute());
    }
  }

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

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final AuthState state) =>
      layout(state);

  @override
  Widget buildMobileLayout(final BuildContext context, final AuthState state) =>
      layout(state);

  Widget layout(final AuthState state) => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      BadgeContainer(
        badgeText: "1",
        child: InfoBlock(
          padding: const EdgeInsets.all(8.0),
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
                    children: [
                      TextSpan(
                        text: "Hello there, ",
                        style: GoogleFonts.robotoMono(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2),
                      ),
                      TextSpan(
                        text: state.login,
                        style: GoogleFonts.robotoMono(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              buildLoginPromptText(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 16, right: 16, bottom: 16),
                child: LoginPart(),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
