import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onelenykco/app/common/info_block.dart';
import 'package:onelenykco/app/features/main/data/state/main_cubit.dart';
import 'package:onelenykco/app/features/main/screen/hireme/hire_me.dart';
import 'package:onelenykco/app/features/main/screen/parts/project_ideas_part.dart';
import 'package:onelenykco/app/features/main/screen/profile/profile_part.dart';
import 'package:onelenykco/app/features/main/screen/resume/resume_part.dart';
import 'package:onelenykco/app/features/main/screen/site/site_part.dart';
import 'package:onelenykco/app/features/main/screen/topic/topic_part.dart';

import '../../../common/responsive_util.dart';
import '../data/state/main_state.dart';
import '../data/state/routes.dart';
import '../data/topic/topic_item.dart';
import 'admin/admin_part.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../common/hover_button.dart';
import 'login/login_part.dart';

class _MainScreen extends State<MainScreen> {
  final getIt = GetIt.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final cubit = getIt<MainCubit>();

  Widget bottomCareer({required MainState state}) {
    final cubit = getIt<MainCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
          child: Text(
            "career 💼",
            style: GoogleFonts.robotoMono(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
        HoverButton(
          onTap: () {
            cubit.selectTopic(route: Routes.Resume);
          },
          onDoubleTap: () {},
          color: Colors.white10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Text(
              "resume 📓",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 8),
        HoverButton(
          onTap: () {
            cubit.selectTopic(route: Routes.HireMe);
          },
          onDoubleTap: () {},
          color: Colors.white24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Text(
              "hire me 👀",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget blog({required MainState state}) {
    final cubit = getIt<MainCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
          child: Text(
            "blog 📺",
            style: GoogleFonts.robotoMono(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
        HoverButton(
          onTap: () {
            cubit.selectTopic(route: Routes.Blog);
          },
          onDoubleTap: () {},
          color: Colors.white24,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Text(
              "check it out 👀",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget collaboration({required MainState state}) {
    final cubit = getIt<MainCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
          child: Text(
            "collaboration 🌍",
            style: GoogleFonts.robotoMono(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
        HoverButton(
          onTap: () {
            cubit.selectTopic(route: Routes.HireMe);
          },
          onDoubleTap: () {},
          color: Colors.white24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Text(
              "create together",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
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

  void openMenu() {
    cubit.openMenu();
  }

  Widget buildResponsiveBody({required MainState state}) {
    Widget? content;

    switch (state.activeRoute) {
      case Routes.Collab:
        content = Placeholder();
        break;
      case Routes.Resume:
        content = ResumePart();
        break;
      case Routes.HireMe:
        content = HireMePart();
        break;
      case Routes.Blog:
        content = Placeholder();
        break;
      case Routes.AboutSite:
        content = SiteStoryPart();
        break;
      default:
        content = Placeholder();
        break;
    }
/*    if (state.selectedTopic?.id == state.profileTopic?.id) {
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
    }*/

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF343540),
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Stack(
        children: [
          content,
        ],
      ),
    );
  }

  Widget buildMenuHorizontal(MainState state) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.shade300.withOpacity(0.1),
                      blurRadius: 4.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        0.0,
                        3.0,
                      ),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HoverButton(
                    hoverColor: Colors.blueGrey.shade300.withOpacity(1),
                    color: Colors.blueGrey.shade300.withOpacity(0.8),
                    onTap: openMenu,
                    onDoubleTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.activeRoute?.title ?? "",
                        style: GoogleFonts.robotoMono(
                            fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: state.isMenuOpened,
                child: InfoBlock(
                  color: Colors.transparent,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      InfoBlock(
                        color: Colors.blueGrey.shade300.withOpacity(0.8),
                        child: bottomCareer(state: state),
                      ),
                      InfoBlock(
                          color: Colors.blueGrey.shade300.withOpacity(0.8),
                          child: blog(state: state)),
                      InfoBlock(
                          color: Colors.blueGrey.shade300.withOpacity(0.8),
                          child: collaboration(state: state)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMenuVertical(MainState state) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.shade300.withOpacity(0.1),
                      blurRadius: 4.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        0.0,
                        3.0,
                      ),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HoverButton(
                    hoverColor: Colors.blueGrey.shade300.withOpacity(1),
                    color: Colors.blueGrey.shade300.withOpacity(0.8),
                    onTap: openMenu,
                    onDoubleTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.activeRoute.title ?? "",
                        style: GoogleFonts.robotoMono(
                            fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: state.isMenuOpened,
                child: InfoBlock(
                  color: Colors.transparent,
                  width: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoBlock(
                        color: Colors.blueGrey.shade300.withOpacity(0.8),
                        child: bottomCareer(state: state),
                      ),
                      SizedBox(height: 8),
                      InfoBlock(
                          color: Colors.blueGrey.shade300.withOpacity(0.8),
                          child: blog(state: state)),
                      SizedBox(height: 8),
                      InfoBlock(
                          color: Colors.blueGrey.shade300.withOpacity(0.8),
                          child: collaboration(state: state)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDesktop(MainState state) {
    return Stack(
      children: [
        buildResponsiveBody(state: state),
        buildMenuVertical(state),
      ],
    );
  }

  Widget buildMobile(MainState state) {
    return Stack(
      children: [buildResponsiveBody(state: state), buildMenuHorizontal(state)],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<MainCubit>();

    return BlocConsumer<MainCubit, MainState>(
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
          body: SelectionArea(child: body),
        );
      },
    );
  }
}

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreen createState() => _MainScreen();
}
