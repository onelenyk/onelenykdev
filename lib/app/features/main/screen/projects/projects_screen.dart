import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/features/main/screen/base/mobile_frame.dart";
import "package:onelenykco/app/features/main/screen/projects/timeline_cubit.dart";
import "package:onelenykco/app/features/main/screen/projects/timeline_state.dart";

import "../base/base_screen.dart";
import "../base/responsive_state.dart";

@RoutePage()
class ProjectsScreen extends StatefulWidget {
  ProjectsScreen({super.key});

  final getIt = GetIt.instance;
  late final TimelineCubit cubit = getIt<TimelineCubit>();

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState(cubit);
}

class _ProjectsScreenState
    extends ResponsiveState<ProjectsScreen, TimelineState, TimelineCubit> {
  _ProjectsScreenState(super.cubit);

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final TimelineState state) =>
      layout(state);

  @override
  Widget buildMobileLayout(
          final BuildContext context, final TimelineState state) =>
      layout(state);

  Widget layout(final TimelineState state) => buildBody(state: state);

  Widget buildBody({required final TimelineState state}) => BaseScreen(
          child: MobileFrame(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InfoBlock(
                  child: Row(
                children: [
                  Text(
                    "the timeline",
                    style: GoogleFonts.robotoMono(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 16,
              ),
              Stack(
                children: [
                  VerticalTimeline(
                    reverse: state.reversed,
                    events: [
                      TimelineEvent(
                        title: "YT cover",
                        date: "2021",
                        description:
                            "A YouTube Music app feature that generates a cover image for a shared song by sending the URL to a Node.js server, which extracts the necessary data and returns it. The Android app converts this data into an image and shares it to Instagram via intent.",
                      ),
                      TimelineEvent(
                        title: "audio effect telegram bot",
                        date: "2023",
                        description:
                            "A Telegram bot and server that allows users to upload MP3 files and apply various sound effects to them, then returns the processed files to the users..",
                      ),
                      TimelineEvent(
                        title: "posydy",
                        date: "00.06.2024 - in progress",
                        description: "no description",
                      ),
                      TimelineEvent(
                        title: "Munera",
                        date: "00.06.2024 - in progress",
                        description:
                            "Track your life through tasks completing and imrpove yourself",
                      ),
                      TimelineEvent(
                        title: "timeline",
                        date: "07.06.2024 - in progress",
                        description: "the timeline of project ideas",
                      ),
                      // Add more events here
                    ],
                  ),
                  Align(
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(state.reversed
                          ? Icons.arrow_upward
                          : Icons.arrow_downward),
                      onPressed: cubit.tapButton,
                    ),
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
}

class VerticalTimeline extends StatelessWidget {
  const VerticalTimeline(
      {super.key, required this.events, required this.reverse});

  final List<TimelineEvent> events;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final sortedEvents = reverse ? events.reversed.toList() : events;
    return Column(
      children:
          sortedEvents.map((event) => TimelineItem(event: event)).toList(),
    );
  }
}

class TimelineEvent {
  TimelineEvent({
    required this.title,
    required this.date,
    required this.description,
    this.buttonText,
  });

  final String title;
  final String date;
  final String description;
  final String? buttonText;
}

/*
class TimelineItem extends StatelessWidget {
  const TimelineItem({super.key, required this.event});

  final TimelineEvent event;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              // Move Expanded here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.date,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 12),
                  if (event.buttonText != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(event.buttonText!),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Widget build2(BuildContext context) => IntrinsicHeight(
        child: Row(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              // Move Expanded here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.date,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 12),
                  if (event.buttonText != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(event.buttonText!),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}
*/

class TimelineItem extends StatelessWidget {
  const TimelineItem({super.key, required this.event});

  final TimelineEvent event;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 16,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: InfoBlock(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        event.date,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        event.description,
                        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 12),
                      if (event.buttonText != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(event.buttonText!),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
