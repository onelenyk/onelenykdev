import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import 'responsive_state.dart';

class TestState {
  
}

class TestCubit extends Cubit<TestState> {
  TestCubit(super.initialState);
}

class MyResponsiveWidget extends StatefulWidget {
  MyResponsiveWidget({super.key});

  late final TestCubit cubit = TestCubit(TestState());

  @override
  MyResponsiveWidgetState createState() => MyResponsiveWidgetState(cubit);
}

class MyResponsiveWidgetState extends ResponsiveState<MyResponsiveWidget, TestState, TestCubit> {
  MyResponsiveWidgetState(super.cubit);

  @override
  void onStateChange(
    final BuildContext context,
    final TestState state,
  ) {

  }
  @override
  Widget buildDesktopLayout(
    final BuildContext context,
    final TestState state,
  ) => Container();

  @override
  Widget buildMobileLayout(
    final BuildContext context,
    final TestState state,
  ) => Container();
}
