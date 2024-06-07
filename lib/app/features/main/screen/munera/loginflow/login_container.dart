import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/cupertino.dart";
import "package:onelenykco/app/features/main/screen/base/base_screen.dart";
import "package:onelenykco/app/root/app_router.dart";

@RoutePage()
class LoginContainerScreen extends StatefulWidget {
  const LoginContainerScreen({super.key});

  @override
  State<LoginContainerScreen> createState() => _LoginContainerScreenState();
}

class _LoginContainerScreenState extends State<LoginContainerScreen> {
  @override
  Widget build(final BuildContext context) =>
      const AutoRouter();
}
