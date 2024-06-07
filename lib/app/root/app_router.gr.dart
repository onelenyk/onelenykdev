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
    BlogRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogScreen(),
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
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainScreen(key: args.key),
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
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(key: args.key),
      );
    },
  };
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
