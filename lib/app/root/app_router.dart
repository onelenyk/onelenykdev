import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:onelenykco/app/features/main/screen/blog/blog_page.dart";
import "package:onelenykco/app/features/main/screen/main_page.dart";
import "package:onelenykco/app/features/passwords/screen/passwords_page.dart";

import "../features/main/screen/munera/login/login_screen.dart";
import "../features/main/screen/munera/main/main_munera_screen.dart";
import "../features/main/screen/munera/munera_screen.dart";
import "../features/main/screen/munera/splash/splash_screen.dart";
import "../features/main/screen/posydy/posydy_page.dart";

part "app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: "/", initial: true),
        AutoRoute(page: BlogRoute.page, path: "/blog"),
        AutoRoute(page: PosydyRoute.page, path: "/posydy"),
        AutoRoute(page: MuneraRoute.page, path: "/munera", children: [
          AutoRoute(page: LoginRoute.page, path: "login"),
          AutoRoute(page: MainMuneraRoute.page, path: "main"),
          AutoRoute(page: SplashRoute.page, path: "" , initial: true),
        ]),
      ];
}

