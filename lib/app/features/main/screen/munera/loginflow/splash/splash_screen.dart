import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";

import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/data/firebase/auth/auth_state.dart";
import "package:onelenykco/app/data/firebase/auth_cubit.dart";
import "package:onelenykco/app/features/main/screen/base/base_screen.dart";
import "package:onelenykco/app/features/main/screen/base/responsive_state.dart";
import "package:onelenykco/app/features/main/screen/munera/personal_cubit.dart";
import "package:onelenykco/app/root/app_router.dart";

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

    Future.delayed(Duration(seconds: 2), () {
      if (cubit.isLoggedIn()) {
        print("TEST AuthenticationSuccess");
        context.router.push(const MainContainerRoute());
      } else {
        print("TEST AuthenticationFailed");
        context.router.push(LoginRoute());
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
              child: Row(
                children: [
                  SelectableText.rich(
                    TextSpan(
                      text: "hello",
                      style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
