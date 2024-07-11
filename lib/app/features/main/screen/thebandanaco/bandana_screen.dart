import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykdev/app/common/info_block.dart";
import "package:onelenykdev/app/features/main/screen/base/mobile_frame.dart";

import "../base/base_screen.dart";
import "../base/responsive_state.dart";
import "../notfound/not_found.dart";

@RoutePage()
class BandanaScreen extends StatefulWidget {
  BandanaScreen({super.key});

  final getIt = GetIt.instance;

  final cubit = NullCubit();

  @override
  _BandanaScreenState createState() => _BandanaScreenState(cubit);
}

class _BandanaScreenState
    extends ResponsiveState<BandanaScreen, NullState, NullCubit> {
  _BandanaScreenState(super.cubit);

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final NullState state) =>
      buildBody(state: state);

  @override
  Widget buildMobileLayout(final BuildContext context, final NullState state) =>
      buildBody(state: state);

  Widget buildBody({required final NullState state}) => BaseScreen(
          child: MobileFrame(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [Placeholder()],
          ),
        ),
      ));
}