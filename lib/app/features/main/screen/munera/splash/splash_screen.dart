import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";

import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/root/app_router.dart";

import "../../../../../data/firebase/auth/auth_state.dart";
import "../../../../../data/firebase/auth_cubit.dart";
import "../../base/base_screen.dart";
import "../../base/responsive_state.dart";
import "../personal_cubit.dart";
import "../utils/badge_container.dart";

@RoutePage()
class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  final getIt = GetIt.instance;
  late final PersonalCubit cubit = getIt<PersonalCubit>();
  late final AuthenticationCubit authCubit = getIt<AuthenticationCubit>();

  @override
  _SplashScreenState createState() => _SplashScreenState(authCubit);
}

class _SplashScreenState
    extends ResponsiveState<SplashScreen, AuthState, AuthenticationCubit> {
  _SplashScreenState(super.cubit);

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      if (cubit.isLoggedIn()) {
        print("TEST AuthenticationSuccess");
        context.router.replace(MainMuneraRoute());
      } else {
        print("TEST AuthenticationFailed");
        context.router.replace(LoginRoute());
      }
    });
  }

  @override
  Future<void> onStateChange(
    final BuildContext context,
    final AuthState state,
  ) async {}

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final AuthState state) =>
      layout(state);

  @override
  Widget buildMobileLayout(final BuildContext context, final AuthState state) =>
      layout(state);

  Widget layout(final AuthState state) => BaseScreen(
          child: Column(
            mainAxisSize: MainAxisSize.min,
        children: [
          InfoBlock(
            padding: const EdgeInsets.all(16.0),
            width: 350,
            child: SelectableText.rich(
              TextSpan(
                text: "munera",
                style: GoogleFonts.robotoMono(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2),
              ),
            ),
          ),
          SizedBox(height: 24,),
          InfoBlock(
            padding: const EdgeInsets.all(16.0),
            width: 350,
            child: SelectableText.rich(
              TextSpan(
                text: "hello",
                style: GoogleFonts.robotoMono(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2),
              ),
            ),
          ),
        ],
      ));
}
