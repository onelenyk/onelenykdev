import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:onelenykco/app/common/responsive_util.dart";
import "package:onelenykco/app/common/util/unit.dart";

abstract class ResponsiveState<T extends StatefulWidget, S, C extends Cubit<S>>
    extends State<T> {

  ResponsiveState(this.cubit);
  final C cubit;

  @override
  Widget build(final BuildContext context) => BlocConsumer<C, S>(
    bloc: cubit,
    builder: _buildResponsiveLayout,
    listener: onStateChange,
  );

  void onStateChange(final BuildContext context, final S state) => Unit;

  Widget buildDesktopLayout(final BuildContext context, final S state);
  Widget buildMobileLayout(final BuildContext context, final S state);

  Widget _buildResponsiveLayout(final BuildContext context, final S state) =>
      ResponsiveUtil.isDesktop(context)
          ? buildDesktopLayout(context, state)
          : buildMobileLayout(context, state);
}

