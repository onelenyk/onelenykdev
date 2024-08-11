// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BandanaRoute.name: (routeData) {
      final args = routeData.argsAs<BandanaRouteArgs>(
          orElse: () => const BandanaRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BandanaScreen(key: args.key),
      );
    },
    BlogRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogScreen(),
      );
    },
    CollaborationRoute.name: (routeData) {
      final args = routeData.argsAs<CollaborationRouteArgs>(
          orElse: () => const CollaborationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CollaborationScreen(key: args.key),
      );
    },
    CompositionRoute.name: (routeData) {
      final args = routeData.argsAs<CompositionRouteArgs>(
          orElse: () => const CompositionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompositionScreen(key: args.key),
      );
    },
    ContactsRoute.name: (routeData) {
      final args = routeData.argsAs<ContactsRouteArgs>(
          orElse: () => const ContactsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContactsScreen(key: args.key),
      );
    },
    HireMeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HireMeScreen(),
      );
    },
    LoginContainerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginContainerScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    MainContainerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainContainerScreen(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainNavigationScreen(),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainScreen(key: args.key),
      );
    },
    MobileEraRoute.name: (routeData) {
      final args = routeData.argsAs<MobileEraRouteArgs>(
          orElse: () => const MobileEraRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MobileEraScreen(key: args.key),
      );
    },
    MuneraRoute.name: (routeData) {
      final args = routeData.argsAs<MuneraRouteArgs>(
          orElse: () => const MuneraRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MuneraScreen(key: args.key),
      );
    },
    MyPasswordsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyPasswordsScreen(),
      );
    },
    NotFoundRoute.name: (routeData) {
      final args = routeData.argsAs<NotFoundRouteArgs>(
          orElse: () => const NotFoundRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotFoundScreen(key: args.key),
      );
    },
    PosydyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PosydyScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileScreen(key: args.key),
      );
    },
    ProjectsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectsRouteArgs>(
          orElse: () => const ProjectsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProjectsScreen(key: args.key),
      );
    },
    ResumeRoute.name: (routeData) {
      final args = routeData.argsAs<ResumeRouteArgs>(
          orElse: () => const ResumeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResumeScreen(key: args.key),
      );
    },
    SiteStoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SiteStoryScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(key: args.key),
      );
    },
    TgChannelRoute.name: (routeData) {
      final args = routeData.argsAs<TgChannelRouteArgs>(
          orElse: () => const TgChannelRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TgChannelScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [BandanaScreen]
class BandanaRoute extends PageRouteInfo<BandanaRouteArgs> {
  BandanaRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          BandanaRoute.name,
          args: BandanaRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BandanaRoute';

  static const PageInfo<BandanaRouteArgs> page =
      PageInfo<BandanaRouteArgs>(name);
}

class BandanaRouteArgs {
  const BandanaRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'BandanaRouteArgs{key: $key}';
  }
}

/// generated route for
/// [BlogScreen]
class BlogRoute extends PageRouteInfo<void> {
  const BlogRoute({List<PageRouteInfo>? children})
      : super(
          BlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CollaborationScreen]
class CollaborationRoute extends PageRouteInfo<CollaborationRouteArgs> {
  CollaborationRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CollaborationRoute.name,
          args: CollaborationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CollaborationRoute';

  static const PageInfo<CollaborationRouteArgs> page =
      PageInfo<CollaborationRouteArgs>(name);
}

class CollaborationRouteArgs {
  const CollaborationRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CollaborationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CompositionScreen]
class CompositionRoute extends PageRouteInfo<CompositionRouteArgs> {
  CompositionRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CompositionRoute.name,
          args: CompositionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CompositionRoute';

  static const PageInfo<CompositionRouteArgs> page =
      PageInfo<CompositionRouteArgs>(name);
}

class CompositionRouteArgs {
  const CompositionRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CompositionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ContactsScreen]
class ContactsRoute extends PageRouteInfo<ContactsRouteArgs> {
  ContactsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ContactsRoute.name,
          args: ContactsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ContactsRoute';

  static const PageInfo<ContactsRouteArgs> page =
      PageInfo<ContactsRouteArgs>(name);
}

class ContactsRouteArgs {
  const ContactsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ContactsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [HireMeScreen]
class HireMeRoute extends PageRouteInfo<void> {
  const HireMeRoute({List<PageRouteInfo>? children})
      : super(
          HireMeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HireMeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginContainerScreen]
class LoginContainerRoute extends PageRouteInfo<void> {
  const LoginContainerRoute({List<PageRouteInfo>? children})
      : super(
          LoginContainerRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginContainerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MainContainerScreen]
class MainContainerRoute extends PageRouteInfo<void> {
  const MainContainerRoute({List<PageRouteInfo>? children})
      : super(
          MainContainerRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainContainerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavigationScreen]
class MainNavigationRoute extends PageRouteInfo<void> {
  const MainNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MainNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<MainRouteArgs> page = PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MobileEraScreen]
class MobileEraRoute extends PageRouteInfo<MobileEraRouteArgs> {
  MobileEraRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MobileEraRoute.name,
          args: MobileEraRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MobileEraRoute';

  static const PageInfo<MobileEraRouteArgs> page =
      PageInfo<MobileEraRouteArgs>(name);
}

class MobileEraRouteArgs {
  const MobileEraRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MobileEraRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MuneraScreen]
class MuneraRoute extends PageRouteInfo<MuneraRouteArgs> {
  MuneraRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MuneraRoute.name,
          args: MuneraRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MuneraRoute';

  static const PageInfo<MuneraRouteArgs> page = PageInfo<MuneraRouteArgs>(name);
}

class MuneraRouteArgs {
  const MuneraRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MuneraRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MyPasswordsScreen]
class MyPasswordsRoute extends PageRouteInfo<void> {
  const MyPasswordsRoute({List<PageRouteInfo>? children})
      : super(
          MyPasswordsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyPasswordsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotFoundScreen]
class NotFoundRoute extends PageRouteInfo<NotFoundRouteArgs> {
  NotFoundRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NotFoundRoute.name,
          args: NotFoundRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static const PageInfo<NotFoundRouteArgs> page =
      PageInfo<NotFoundRouteArgs>(name);
}

class NotFoundRouteArgs {
  const NotFoundRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'NotFoundRouteArgs{key: $key}';
  }
}

/// generated route for
/// [PosydyScreen]
class PosydyRoute extends PageRouteInfo<void> {
  const PosydyRoute({List<PageRouteInfo>? children})
      : super(
          PosydyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PosydyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProjectsScreen]
class ProjectsRoute extends PageRouteInfo<ProjectsRouteArgs> {
  ProjectsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProjectsRoute.name,
          args: ProjectsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProjectsRoute';

  static const PageInfo<ProjectsRouteArgs> page =
      PageInfo<ProjectsRouteArgs>(name);
}

class ProjectsRouteArgs {
  const ProjectsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ProjectsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ResumeScreen]
class ResumeRoute extends PageRouteInfo<ResumeRouteArgs> {
  ResumeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ResumeRoute.name,
          args: ResumeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ResumeRoute';

  static const PageInfo<ResumeRouteArgs> page = PageInfo<ResumeRouteArgs>(name);
}

class ResumeRouteArgs {
  const ResumeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ResumeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SiteStoryScreen]
class SiteStoryRoute extends PageRouteInfo<void> {
  const SiteStoryRoute({List<PageRouteInfo>? children})
      : super(
          SiteStoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SiteStoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<SplashRouteArgs> page = PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [TgChannelScreen]
class TgChannelRoute extends PageRouteInfo<TgChannelRouteArgs> {
  TgChannelRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TgChannelRoute.name,
          args: TgChannelRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TgChannelRoute';

  static const PageInfo<TgChannelRouteArgs> page =
      PageInfo<TgChannelRouteArgs>(name);
}

class TgChannelRouteArgs {
  const TgChannelRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'TgChannelRouteArgs{key: $key}';
  }
}
