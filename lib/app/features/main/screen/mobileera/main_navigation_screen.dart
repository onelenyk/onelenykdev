import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykdev/app/common/info_block.dart";
import "package:onelenykdev/app/root/app_router.dart";

import "../../../../common/hover_button.dart";
import "../base/mobile_frame.dart";

@RoutePage()
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  Widget buildScreenHeader(final int activeIndex) {
    const maxIndex = 2;
    final showBack = activeIndex > maxIndex;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Visibility(
          visible: showBack,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: HoverButton(
              onTap: (){
                final router = AutoRouter.of(context);
                router.back();
              },
              onDoubleTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(final BuildContext context) {
    final textTheme = GoogleFonts.robotoMono(
      fontSize: 12,
      color: Colors.red,
      fontWeight: FontWeight.normal,
    );

    return AutoTabsRouter.builder(
      routes: [
        ResumeRoute(),
        ProjectsRoute(),
        ContactsRoute(),

        HireMeRoute(),
        CollaborationRoute(),
        SiteStoryRoute(),
        BlogRoute(),
      ],
      builder: (
        final context,
        final children,
        final tabsRouter,
      ) {
        const maxIndex = 2;

        final int currentIndex;

        if (tabsRouter.activeIndex >= maxIndex) {
          currentIndex = maxIndex;
        } else{
          currentIndex = tabsRouter.activeIndex;
        }

        var contactsItemLabel;
        final items = [
          "resume",
          "projects",
          "contacts",

          "hire me",
          "collaboration",
          "site story",
          "blog",
        ];

        if(tabsRouter.activeIndex > maxIndex){
          contactsItemLabel = items[tabsRouter.activeIndex];
        }else{
          contactsItemLabel = items[maxIndex];
        }

        return InfoBlock(
          child: Column(
            children: [
              buildScreenHeader(tabsRouter.activeIndex),
              Flexible(child: children[tabsRouter.activeIndex]),
              BottomNavigationBar(
                selectedLabelStyle: textTheme,
                unselectedLabelStyle: textTheme,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Text("💼️"),
                    label: "resume",
                  ),
                  BottomNavigationBarItem(
                    icon: const Text("⚒️"),
                    label: "projects",
                  ),
                  BottomNavigationBarItem(
                    icon: const Text("👾"),
                    label: contactsItemLabel,
                  ),
                ],
                currentIndex: currentIndex,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white38,
                elevation: 0,
                onTap: tabsRouter.setActiveIndex,
                backgroundColor: Colors.grey.shade900,
              ),
            ],
          ),
        );
      },
    );
  }
}
