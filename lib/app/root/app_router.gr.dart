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
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainScreen(key: args.key),
      );
    },
    MuneraRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MuneraScreen(),
      );
    },
    MyPasswordsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyPasswordsScreen(),
      );
    },
    PersonalRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalRouteArgs>(
          orElse: () => const PersonalRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PersonalScreen(key: args.key),
      );
    },
    PosydyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PosydyScreen(),
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
class MuneraRoute extends PageRouteInfo<void> {
  const MuneraRoute({List<PageRouteInfo>? children})
      : super(
          MuneraRoute.name,
          initialChildren: children,
        );

  static const String name = 'MuneraRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [PersonalScreen]
class PersonalRoute extends PageRouteInfo<PersonalRouteArgs> {
  PersonalRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PersonalRoute.name,
          args: PersonalRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PersonalRoute';

  static const PageInfo<PersonalRouteArgs> page =
      PageInfo<PersonalRouteArgs>(name);
}

class PersonalRouteArgs {
  const PersonalRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'PersonalRouteArgs{key: $key}';
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
