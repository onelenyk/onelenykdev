import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/features/main/screen/base/base_screen.dart";
import "package:onelenykco/app/features/main/screen/base/mobile_frame.dart";
import "package:onelenykco/app/root/app_router.dart";

@RoutePage()
class MainContainerScreen extends StatefulWidget {
  const MainContainerScreen({super.key});

  @override
  State<MainContainerScreen> createState() => _MainContainerScreenState();
}

class _MainContainerScreenState extends State<MainContainerScreen> {
  int _navigationIndex = 0;

  void _onItemTapped(final int index) {
    setState(() {
      _navigationIndex = index;
    });

    switch (index) {
      case 0:
        {
          context.router.push(MainRoute());
          return;
        }
      case 1:
        {
          context.router.push(ProfileRoute());
          return;
        }
    }
  }

  @override
  Widget build(final BuildContext context) {
    final textTheme = GoogleFonts.robotoMono(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );

    return AutoTabsRouter.builder(
      routes: [
        MainRoute(),
        ProfileRoute(),
      ],
      builder: (
        final context,
        final children,
        final tabsRouter,
      ) =>
          Column(
        children: [
          Flexible(child: children[tabsRouter.activeIndex]),
          Container(
            clipBehavior: Clip.hardEdge,
            //or better look(and cost) using Clip.antiAlias,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: BottomNavigationBar(
              selectedLabelStyle: textTheme,
              unselectedLabelStyle: textTheme,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.grey.shade900,
                  icon: const Icon(Icons.home),
                  label: "Main",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.grey.shade900,
                  icon: const Icon(Icons.school),
                  label: "Profile",
                ),
              ],
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.grey.shade900,
              elevation: 0,
              onTap: tabsRouter.setActiveIndex,
            ),
          ),
        ],
      ),
    );
  }
}
