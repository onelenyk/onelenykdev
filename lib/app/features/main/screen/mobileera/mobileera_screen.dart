import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykdev/app/common/hover_button.dart";
import "package:onelenykdev/app/common/info_block.dart";
import "package:onelenykdev/app/common/responsive_util.dart";
import "package:onelenykdev/app/features/main/data/state/main_cubit.dart";
import "package:onelenykdev/app/features/main/data/state/main_state.dart";
import "package:onelenykdev/app/features/main/data/state/routes.dart";

import "../base/base_screen.dart";
import "../base/mobile_frame.dart";
import "../base/responsive_state.dart";

@RoutePage()
class MobileEraScreen extends StatefulWidget {
  MobileEraScreen({super.key});

  final getIt = GetIt.instance;
  late final MainCubit cubit = getIt<MainCubit>();

  @override
  _MobileEraScreenState createState() => _MobileEraScreenState(cubit);
}

class _MobileEraScreenState
    extends ResponsiveState<MobileEraScreen, MainState, MainCubit> {
  _MobileEraScreenState(super.cubit);

  @override
  void onStateChange(
    final BuildContext context,
    final MainState state,
  ) {}

  @override
  Widget buildDesktopLayout(
    final BuildContext context,
    final MainState state,
  ) =>
      buildBody(state: state);

  @override
  Widget buildMobileLayout(
    final BuildContext context,
    final MainState state,
  ) =>
      buildBody(state: state);

/*  Widget buildBody({required final MainState state}) => MobileFrame(
    child: Center(
      child: BaseScreen(
            child: MobileFrame(
              child: Container(
                color: Colors.amber,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '404',
                        style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'The page you are looking for does not exist.',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      HoverButton(
                        onTap: () {
                          context.router.replace(CompositionRoute());
                        },
                        onDoubleTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: Text(
                            "home",
                            style: GoogleFonts.robotoMono(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            // Handle navigation tap
          },
        ),
          ),
    ),
  );*/

  Widget buildBody({required final MainState state}) =>
      BaseScreen(child: const MobileFrame(child: AutoRouter()));
}
