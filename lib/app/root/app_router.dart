import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:onelenykdev/app/features/main/screen/blog/blog_page.dart";
import "package:onelenykdev/app/features/main/screen/collaboration/collaboration_screen.dart";
import "package:onelenykdev/app/features/main/screen/composition_screen.dart";
import "package:onelenykdev/app/features/main/screen/hireme/hire_me_screen.dart";
import "package:onelenykdev/app/features/main/screen/mobileera/mobileera_screen.dart";
import "package:onelenykdev/app/features/main/screen/munera/loginflow/login_container.dart";
import "package:onelenykdev/app/features/main/screen/munera/loginflow/login_screen.dart";
import "package:onelenykdev/app/features/main/screen/munera/loginflow/splash/splash_screen.dart";
import "package:onelenykdev/app/features/main/screen/munera/mainflow/main_container.dart";
import "package:onelenykdev/app/features/main/screen/munera/mainflow/main_screen.dart";
import "package:onelenykdev/app/features/main/screen/munera/mainflow/profile/profile_screen.dart";
import "package:onelenykdev/app/features/main/screen/munera/munera_screen.dart";
import "package:onelenykdev/app/features/main/screen/notfound/not_found.dart";
import "package:onelenykdev/app/features/main/screen/posydy/posydy_page.dart";
import "package:onelenykdev/app/features/main/screen/projects/projects_screen.dart";
import "package:onelenykdev/app/features/main/screen/site/site_story_screen.dart";
import "package:onelenykdev/app/features/main/screen/thebandanaco/bandana_screen.dart";
import "package:onelenykdev/app/features/passwords/screen/passwords_page.dart";

import "../features/main/screen/mobileera/contacts_screen.dart";
import "../features/main/screen/mobileera/main_navigation_screen.dart";
import "../features/main/screen/resume/resume_screen.dart";
import "../features/main/screen/tgchannel/tg_channel.dart";

part "app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: CompositionRoute.page, path: "/", initial: true),
        AutoRoute(
          page: MobileEraRoute.page,
          path: "/",
          children: [
            AutoRoute(page: MainNavigationRoute.page, path: "", children: [
              AutoRoute(page: ResumeRoute.page, path: "resume"),
              AutoRoute(page: ProjectsRoute.page, path: "projects"),
              AutoRoute(
                page: ContactsRoute.page,
                path: "contacts",
                initial: true,
              ),

              AutoRoute(page: SiteStoryRoute.page, path: "story"),
              AutoRoute(page: CollaborationRoute.page, path: "collab"),
              AutoRoute(page: HireMeRoute.page, path: "hire"),
              AutoRoute(page: BlogRoute.page, path: "blog"),

            ]),

          ],
        ),
        AutoRoute(page: BandanaRoute.page, path: "/thebandana.co"),
        AutoRoute(page: TgChannelRoute.page, path: "/tg"),
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
