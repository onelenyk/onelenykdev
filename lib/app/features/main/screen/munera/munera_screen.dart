import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:onelenykco/app/features/main/screen/munera/personal_cubit.dart";
import "package:onelenykco/app/features/main/screen/munera/personal_state.dart";

import "../base/responsive_state.dart";

@RoutePage()
class MuneraScreen extends StatefulWidget {
  MuneraScreen({super.key});

  final getIt = GetIt.instance;
  late final PersonalCubit cubit = getIt<PersonalCubit>();

  @override
  _MuneraScreenState createState() => _MuneraScreenState(cubit);
}

class _MuneraScreenState extends ResponsiveState<MuneraScreen, PersonalState, PersonalCubit> {
  _MuneraScreenState(super.cubit);

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

  Widget buildBody({required final PersonalState state}) => const AutoRouter();
}



