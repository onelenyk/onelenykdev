import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/data/firebase/auth/auth_state.dart";
import "package:onelenykco/app/data/firebase/auth_cubit.dart";
import "package:onelenykco/app/features/main/screen/base/base_screen.dart";
import "package:onelenykco/app/features/main/screen/base/responsive_state.dart";
import "package:onelenykco/app/features/main/screen/login/login_part.dart";
import "package:onelenykco/app/features/main/screen/munera/personal_cubit.dart";

import "../../utils/badge_container.dart";

@RoutePage()
class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  final getIt = GetIt.instance;
  late final PersonalCubit cubit = getIt<PersonalCubit>();
  late final AuthenticationCubit authCubit = getIt<AuthenticationCubit>();

  @override
  _ProfileScreenState createState() => _ProfileScreenState(authCubit);
}

class _ProfileScreenState
    extends ResponsiveState<ProfileScreen, AuthState, AuthenticationCubit> {
  _ProfileScreenState(super.cubit);

  @override
  Future<void> onStateChange(
    final BuildContext context,
    final AuthState state,
  ) async {}

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final AuthState state) =>
      layout(state);

  Widget buildSelectableText(final List<TextSpan> hello) => Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: SelectableText.rich(
          TextSpan(
            style: GoogleFonts.robotoMono(fontSize: 14, color: Colors.white),
            children: hello,
          ),
        ),
      );

  @override
  Widget buildMobileLayout(final BuildContext context, final AuthState state) =>
      layout(state);

  Widget layout(final AuthState state) {
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
        text: state.login,
        style: GoogleFonts.robotoMono(
            fontSize: 14,
            color: Colors.red,
            fontWeight: FontWeight.bold,
            letterSpacing: 2),
      ),
    ];
    return Column(
      children: [
        InfoBlock(
          width: double.maxFinite,
          padding: const EdgeInsets.all(8.0),
          child: buildSelectableText(hello),
        ),
        const SizedBox(height: 16),
        InfoBlock(
          child: LoginPart(),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
