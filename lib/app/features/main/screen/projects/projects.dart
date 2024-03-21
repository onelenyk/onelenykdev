import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/hover_button.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/link_utils.dart";
import "package:onelenykco/app/common/ui/rounded_container.dart";
import "package:screenshot/screenshot.dart";

import "../../../../common/ui/powered_flutter.dart";
import "../../data/resume/resume_cubit.dart";
import "../../data/resume/resume_state.dart";
import "../base/responsive_state.dart";
import "../resume/resume_part.dart";

class ProjectsPart extends StatefulWidget {
  ProjectsPart({super.key});

  final getIt = GetIt.instance;
  late final ResumeCubit cubit = getIt.get<ResumeCubit>();

  @override
  _ProjectsPartState createState() => _ProjectsPartState(cubit);
}

class _ProjectsPartState
    extends ResponsiveState<ProjectsPart, ResumeState, ResumeCubit> {
  _ProjectsPartState(super.cubit);

  @override
  Future<void> onStateChange(
    final BuildContext context,
    final ResumeState state,
  ) async {}

  @override
  Widget buildDesktopLayout(
    final BuildContext context,
    final ResumeState state,
  ) =>
      desktopLayout(state);

  @override
  Widget buildMobileLayout(
    final BuildContext context,
    final ResumeState state,
  ) =>
      mobileLayout(state);

  Widget mobileLayout(final ResumeState state) => Center(
      child: Placeholder()
  );

  Widget desktopLayout(final ResumeState state) => Center(
        child: Placeholder()
  );

}
