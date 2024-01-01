import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onelenykco/app/features/main/data/state/main_cubit.dart';
import 'package:onelenykco/app/features/main/screen/hireme/hire_me.dart';
import 'package:onelenykco/app/features/main/screen/parts/project_ideas_part.dart';
import 'package:onelenykco/app/features/main/screen/profile/profile_part.dart';
import 'package:onelenykco/app/features/main/screen/resume/resume_part.dart';
import 'package:onelenykco/app/features/main/screen/site/site_part.dart';
import 'package:onelenykco/app/features/main/screen/topic/topic_part.dart';

import '../../../common/responsive_util.dart';
import '../data/state/main_state.dart';
import '../data/topic/topic_item.dart';
import 'admin/admin_part.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../common/hover_button.dart';
import 'login/login_part.dart';

class _MainScreen extends State<MainScreen> {
  final getIt = GetIt.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final cubit = getIt<MainCubit>();

  Widget listItem(TopicItem item, bool showDateHeader, VoidCallback onTap) {
    var date = timeago.format(item.date ?? DateTime.now());

    return Column(
      children: [
        if (showDateHeader)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(
              children: [
                Text(
                  date,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        HoverButton(
          onTap: onTap,
          onDoubleTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${item.content?.title}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget projectsButton({required MainState state}) {
    final cubit = getIt<MainCubit>();
    var projectsTopic = state.projectsTopic;

    return HoverButton(
      onTap: () {
        if (projectsTopic != null) {
          cubit.selectTopic(topic: projectsTopic);
        }
      },
      onDoubleTap: () {
        if (projectsTopic != null) {}
      },
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(
              "${projectsTopic?.content?.title}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomCareer({required MainState state}) {
    final cubit = getIt<MainCubit>();

    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding:
              const EdgeInsets.only(left: 12, right: 12, bottom: 18, top: 8),
          child: Text(
            "career 💼",
            style: GoogleFonts.robotoMono(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
        HoverButton(
          onTap: () {
            cubit.selectTopic(topic: resumeItem);
          },
          onDoubleTap: () {},
          color: Colors.white10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(
              children: [
                Text(
                  "resume 📓",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        HoverButton(
          onTap: () {
            cubit.selectTopic(topic: hireMeItem);
          },
          onDoubleTap: () {},
          color: Colors.white24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(
              children: [
                Text(
                  "hire me 👀",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget collaboration({required MainState state}) {
    final cubit = getIt<MainCubit>();

    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding:
              const EdgeInsets.only(left: 12, right: 12, bottom: 18, top: 8),
          child: Text(
            "collaboration 🌍",
            style: GoogleFonts.robotoMono(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(height: 8),
        HoverButton(
          onTap: () {
            cubit.selectTopic(topic: hireMeItem);
          },
          onDoubleTap: () {},
          color: Colors.white24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(
              children: [
                Text(
                  "create together",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomProfile({required MainState state}) {
    final cubit = getIt<MainCubit>();
    var profileTopic = state.profileTopic;

    return HoverButton(
      onTap: () {
        if (profileTopic != null) {
          cubit.selectTopic(topic: profileTopic);
        }
      },
      onDoubleTap: () {
        if (profileTopic != null) {}
      },
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Wrap(
          children: [
            Text(
              profileTopic?.content?.title ?? "",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Spacer(),
            LoginPart()
          ],
        ),
      ),
    );
  }

  Widget buildLeftPanel({required MainState state}) {
    final cubit = getIt<MainCubit>();
    var topics = state.sortedTopics;

    return Container(
      color: Colors.black,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 250, maxWidth: 250),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.white24,
                      style: BorderStyle.solid,
                      width: 1.0,
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "topics 💬",
                      style: GoogleFonts.robotoMono(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    //  projectsButton(state: state),
                    Column(
                      children: topics.map((item) {
                        var date = timeago.format(item.date!);
                        var itemIndex = topics.indexOf(item);
                        var nextIndex =
                            itemIndex > 1 ? itemIndex - 1 : itemIndex;
                        var nextDate =
                            timeago.format(topics[nextIndex].date!);

                        bool showDateHeader =
                            itemIndex == 0 || date != nextDate;

                        var onTap = () {
                          cubit.selectTopic(topic: item);
                        };

                        return listItem(item = item,
                            showDateHeader = showDateHeader, onTap = onTap);
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.white24,
                      style: BorderStyle.solid,
                      width: 1.0,
                    )),
                child: collaboration(state: state),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.white24,
                      style: BorderStyle.solid,
                      width: 1.0,
                    )),
                child: Column(
                  children: [
                    bottomCareer(state: state),
                    SizedBox(height: 8),
                    bottomProfile(state: state),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMainPanel(
      {required MainState state, required VoidCallback openMenu}) {
    Widget? content;
    if (state.selectedTopic?.id == state.profileTopic?.id) {
      content = ProfilePart();
    } else if (state.selectedTopic?.id == state.hireMeTopic?.id) {
      content = HireMePart();
    } else if (state.selectedTopic?.id == state.resumeTopic?.id) {
      content = ResumePart();
    } else if (state.selectedTopic?.id == adminItem.id) {
      content = AdminPart();
    } else if (state.selectedTopic?.id == "z1HuZOodkDqck1KWe1Rr") {
      content = SiteStoryPart();
    } else if (state.selectedTopic?.content != null) {
      content = TopicPart(content: state.selectedTopic!.content!);
    } else {
      content = Container();
    }
    // child: Stack(alignment: Alignment.center, children: []),
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF343540),
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Stack(
        children: [
          content,
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  HoverButton(
                    onTap: openDrawer,
                    onDoubleTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.selectedTopic?.content?.title ?? "",
                        style: GoogleFonts.robotoMono(
                            fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showLoginDialog(BuildContext context) async {
    String email = '';
    String password = '';

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button to close the dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Login'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Login'),
              onPressed: () {
                // Implement your login logic here
                print('Email: $email, Password: $password');
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void openDrawer() {
    //  _scaffoldKey.currentState?.openDrawer();
    cubit.refresh();
    cubit.openMenu();
  }

  Widget buildDesktop(MainState state) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(children: [
        buildLeftPanel(state: state),
        Flexible(
          child: buildMainPanel(
              state: state,
              openMenu: () => {
                    openDrawer(),
                  }),
        ),
      ]),
    );
  }

  Widget buildMobile(MainState state) {
    var menu = Positioned(
        child: Row(
      children: [
        Visibility(
          visible: state.isMenuOpened,
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.60, // 60% width
              child: buildLeftPanel(state: state)),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: HoverButton(
            radius: 12,
            color: Colors.transparent,
            onTap: () {
              openDrawer();
            },
            onDoubleTap: () {},
            child: Icon(
              FontAwesomeIcons.caretRight,
              size: 24,
            ),
          ),
        ),
      ],
    ));

    return Stack(
      children: [
        Container(
          child: buildMainPanel(
              state: state,
              openMenu: () => {
                    openDrawer(),
                  }),
        ),
        menu
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<MainCubit>();

    return SelectionArea(
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          _scaffoldKey.currentState?.closeDrawer();
          return;
        },
        bloc: cubit, // Provide the cubit
        builder: (context, state) {
          Widget body;
          if (ResponsiveUtil.isDesktop(context)) {
            body = buildDesktop(state);
          } else {
            body = buildMobile(state);
          }
          return Scaffold(
            backgroundColor: Colors.transparent,
            key: _scaffoldKey,
            body: body,
          );
        },
      ),
    );
  }
}

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreen createState() => _MainScreen();
}
