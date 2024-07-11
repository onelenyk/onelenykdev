import "dart:convert";
import "dart:ui";

import "package:auto_route/auto_route.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_svg/svg.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:onelenykdev/app/common/info_block.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/terminal.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/tg_cubit.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/tg_state.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/what_is_it.dart";
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
import "kotlincli_post.dart";
import "markdown_renderer.dart";

@RoutePage()
class TgChannelScreen extends StatefulWidget {
  TgChannelScreen({super.key});

  final getIt = GetIt.instance;
  late final TgCubit cubit = getIt.get<TgCubit>();

  @override
  _TgChannelScreenState createState() => _TgChannelScreenState(cubit);
}

class _TgChannelScreenState
    extends ResponsiveState<TgChannelScreen, TgState, TgCubit> {
  _TgChannelScreenState(super.cubit);

  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  void onStateChange(
    final BuildContext context,
    final TgState state,
  ) {
    print("TG state onStateChange ${state.selectedItem?.id}");
  }

  @override
  Widget buildDesktopLayout(final BuildContext context, final TgState state) =>
      buildBody(state: state);

  @override
  Widget buildMobileLayout(final BuildContext context, final TgState state) =>
      buildBody(state: state);

  Widget buildMenu({required final TgState state}) => InfoBlock(
        width: 300,
        color: Colors.grey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: state.items.length,
              separatorBuilder: (final context, final index) =>
                  const SizedBox(height: 8),
              itemBuilder: (final context, index) {
                final item = state.items[index];
                final isSelected = item == state.selectedItem;
                final Color textColor;

                if (isSelected) {
                  textColor = Colors.amber;
                } else {
                  textColor = Colors.white;
                }

                return Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.bottomCenter,
                  children: [
                    HoverButton(
                      onTap: () {
                        cubit.selectItem(item);
                      },
                      onDoubleTap: () {},
                      color: item.brandColor.withAlpha(100),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Text(
                              "${item.id}. ${item.topicName}",
                              style: TextStyle(color: textColor),
                            ),
                            const Spacer(),
                            InfoBlock(
                              width: 24,
                              color: Colors.grey.shade300,
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                item.posted
                                    ? Icons.check_circle
                                    : Icons.access_time_filled,
                                color: item.posted
                                    ? Colors.green
                                    : Colors.redAccent,
                                size: 16,
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            InfoBlock(
                              width: 24,
                              color: Colors.white,
                              padding: const EdgeInsets.all(4),
                              child: SvgPicture.network(
                                item.topicIcon,
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*      IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: item.brandColor.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0),
                            child: Row(
                              children: [
                                Text(
                                  item.posted ? "posted" : "upcoming",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:  item.posted ? Colors.red :  Colors.yellow,),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                );
              },
            ),
          ],
        ),
      );

  Widget buildContent({required final TgState state}) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: InfoBlock(
              child: TerminalRenderer(
                onUpdate: (updatedModel) {
                  cubit.updateItem(updatedModel);
                },
                item: state.selectedItem!,
                screenshotController: _screenshotController,
              ),
            ),
          ),
        ],
      );

  Widget buildBody({required final TgState state}) => BaseScreen(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Sidebar for list of items
                buildMenu(state: state),
                const SizedBox(
                  width: 32,
                ),
                // Main content area
                //     buildContent(state: state),

                buildContent(state: state)
              ],
            ),
    /*        ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  width: 800,
                  height: 600,
                  color: Colors.grey.withOpacity(0.05),
                  alignment: Alignment.center,
                ),
              ),
            ),*/
          ],
        ),
      );
}
