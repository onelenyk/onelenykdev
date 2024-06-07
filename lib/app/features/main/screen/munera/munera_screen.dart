import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/features/main/screen/base/base_screen.dart";
import "package:onelenykco/app/features/main/screen/base/mobile_frame.dart";
import "package:onelenykco/app/features/main/screen/munera/personal_cubit.dart";
import "package:onelenykco/app/features/main/screen/munera/personal_state.dart";
import "package:onelenykco/app/root/app_router.dart";

import "../base/responsive_state.dart";

@RoutePage()
class MuneraScreen extends StatefulWidget {
  MuneraScreen({super.key});

  final getIt = GetIt.instance;
  late final PersonalCubit cubit = getIt<PersonalCubit>();

  @override
  _MuneraScreenState createState() => _MuneraScreenState(cubit);
}

class _MuneraScreenState
    extends ResponsiveState<MuneraScreen, PersonalState, PersonalCubit> {
  _MuneraScreenState(super.cubit);

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final PersonalState state) =>
      layout(state);

  @override
  Widget buildMobileLayout(
          final BuildContext context, final PersonalState state) =>
      layout(state);

  Widget layout(final PersonalState state) => buildBody(state: state);

  Widget buildBody({required final PersonalState state}) => BaseScreen(child: const MobileFrame(child: AutoRouter()));
}
