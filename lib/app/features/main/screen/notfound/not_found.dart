import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/features/main/screen/base/mobile_frame.dart";

import "../../../../common/hover_button.dart";
import "../../../../root/app_router.dart";
import "../base/base_screen.dart";
import "../base/responsive_state.dart";

@RoutePage()
class NotFoundScreen extends StatefulWidget {
  NotFoundScreen({super.key});

  final getIt = GetIt.instance;

  final cubit = NullCubit();

  @override
  _NotFoundScreenState createState() => _NotFoundScreenState(cubit);
}

class _NotFoundScreenState
    extends ResponsiveState<NotFoundScreen, NullState, NullCubit> {
  _NotFoundScreenState(super.cubit);

  @override
  Widget buildDesktopLayout(
          final BuildContext context, final NullState state) =>
      buildBody(state: state);

  @override
  Widget buildMobileLayout(final BuildContext context, final NullState state) =>
      buildBody(state: state);

  Widget buildBody({required final NullState state}) => BaseScreen(
          child: MobileFrame(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
      ));
}

// Define a NullState that doesn't hold any specific data
class NullState {}

// Define a NullCubit that doesn't perform any actions
class NullCubit extends Cubit<NullState> {
  NullCubit() : super(NullState());
}
