import "dart:convert";

import "package:auto_route/auto_route.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_svg/svg.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/features/main/screen/tgchannel/terminal.dart";
import "package:screenshot/screenshot.dart";
import "dart:html" as html;

import "../../../../common/hover_button.dart";
import "../notfound/not_found.dart";
import "../base/base_screen.dart";
import "../base/responsive_state.dart";
import "../resume/pdf_generator.dart";
import 'package:image/image.dart' as img;

import "gradle_post.dart";
import "image_saver.dart";
import "markdown_renderer.dart";

@RoutePage()
class TgChannelScreen extends StatefulWidget {
  TgChannelScreen({super.key});

  final getIt = GetIt.instance;

  final cubit = NullCubit();

  @override
  _TgChannelScreenState createState() => _TgChannelScreenState(cubit);
}

class _TgChannelScreenState
    extends ResponsiveState<TgChannelScreen, NullState, NullCubit> {
  _TgChannelScreenState(super.cubit);

  final List<WhatIsItModel> items = [
    gradlepost1,
    gradlepost2,
    gradlepost3,
  ];

  final List<ScreenshotController> screenshotControllers = List.generate(
    3,
    (_) => ScreenshotController(),
  );

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final NullState state) =>
      buildBody(state: state);

  @override
  Widget buildMobileLayout(final BuildContext context, final NullState state) =>
      buildBody(state: state);

  Widget buildBody({required final NullState state}) => BaseScreen(
          child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(items.length, (index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InfoBlock(
                  child: TerminalView(
                    params: items[index],
                    screenshotController: screenshotControllers[index],
                    onUpdate: (updatedModel) {
                      setState(() {
                        items[index] = updatedModel;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
              ],
            );
          }),
        ),
      ));
}

class CustomGrid extends StatelessWidget {
  final List<Widget> children;
  final Size cellSize;
  final int rows;
  final int columns;

  CustomGrid({
    required this.children,
    required this.rows,
    required this.columns,
    required this.cellSize,
  });

  Widget cell(final Widget content) => Container(
        width: cellSize.width,
        height: cellSize.height,
        child: content,
      );

  @override
  Widget build(final BuildContext context) {
    // Calculate the number of items to display
    final itemCount = rows * columns;
    // Ensure we don't exceed the number of children provided
    final gridItems = children.take(itemCount).toList();

    return GridView.extent(
      maxCrossAxisExtent: cellSize.width,
      childAspectRatio: cellSize.width / cellSize.height,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: List.generate(
        itemCount,
        (index) => cell(
          gridItems.elementAtOrNull(index) ?? const Placeholder(),
        ),
      ),
    );
  }
}
