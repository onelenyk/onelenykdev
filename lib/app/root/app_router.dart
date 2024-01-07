import "package:auto_route/auto_route.dart";

import "package:onelenykco/app/features/main/screen/main_page.dart";
import "package:onelenykco/app/features/passwords/screen/passwords_page.dart";

part "app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, path: "/",initial: true),
    RedirectRoute(path: "*", redirectTo: "/"),
  ];
 }