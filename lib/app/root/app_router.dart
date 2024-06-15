import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:onelenykco/app/features/main/screen/blog/blog_page.dart";
import "package:onelenykco/app/features/main/screen/composition_screen.dart";
import "package:onelenykco/app/features/main/screen/munera/loginflow/login_container.dart";
import "package:onelenykco/app/features/main/screen/munera/loginflow/login_screen.dart";
import "package:onelenykco/app/features/main/screen/munera/loginflow/splash/splash_screen.dart";
import "package:onelenykco/app/features/main/screen/munera/mainflow/main_container.dart";
import "package:onelenykco/app/features/main/screen/munera/mainflow/main_screen.dart";
import "package:onelenykco/app/features/main/screen/munera/mainflow/profile/profile_screen.dart";
import "package:onelenykco/app/features/main/screen/munera/munera_screen.dart";
import "package:onelenykco/app/features/main/screen/posydy/posydy_page.dart";
import "package:onelenykco/app/features/passwords/screen/passwords_page.dart";

import "../features/main/screen/projects/projects_screen.dart";

part "app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CompositionRoute.page, path: "/", initial: true),
        AutoRoute(page: BlogRoute.page, path: "/blog"),
        AutoRoute(page: ProjectsRoute.page, path: "/timeline"),
        AutoRoute(page: PosydyRoute.page, path: "/posydy"),
        CustomRoute(
          page: MuneraRoute.page,
          path: "/munera",
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          children: [
            CustomRoute(
              page: LoginContainerRoute.page,
              path: "",
              initial: true,
              durationInMilliseconds: 400,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              children: [
                CustomRoute(
                  page: SplashRoute.page,
                  path: "",
                  initial: true,
                  transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                ),
                CustomRoute(
                  page: LoginRoute.page,
                  path: "login",
                  transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                ),
              ],
            ),
            CustomRoute(
              page: MainContainerRoute.page,
              path: "app",
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              durationInMilliseconds: 400,
              children: [
                CustomRoute(
                  page: MainRoute.page,
                  path: "",
                  initial: true,
                  transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                ),
                CustomRoute(
                  page: ProfileRoute.page,
                  path: "profile",
                  transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                ),
              ],
            ),
          ],
        ),

        AutoRoute(page: NotFoundRoute.page, path: "/not-found"),

        // Add the fallback route
        RedirectRoute(path: "*", redirectTo: "/not-found"),
        // Define the not-found route
      ];
}
