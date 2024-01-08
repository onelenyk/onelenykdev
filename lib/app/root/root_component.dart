import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/data/firebase/auth_cubit.dart";
import "package:onelenykco/app/data/repository/topics_repository.dart";
import "package:onelenykco/app/data/services/firestore_service.dart";
import "package:onelenykco/app/features/main/data/admin/admin_cubit.dart";
import "package:onelenykco/app/features/main/data/resume/resume_cubit.dart";
import "package:onelenykco/app/features/main/data/state/main_cubit.dart";
import "package:onelenykco/app/root/app_router.dart";
import "package:onelenykco/main.dart";

class RootComponent extends StatelessWidget {
  RootComponent({super.key}) {
    //  getIt.registerSingleton<ProfileRepository>(ProfileRepository());
    getIt
      ..registerSingleton<TopicsRepository>(TopicsRepository())
      ..registerSingleton<FirestoreService>(FirestoreService())
      ..registerSingleton<MainCubit>(MainCubit())
      ..registerSingleton<AdminCubit>(AdminCubit())
      ..registerSingleton<ResumeCubit>(ResumeCubit())
      ..registerSingleton<AuthenticationCubit>(
          AuthenticationCubit(firebaseAuth));
  }

  final _router = AppRouter();
  final getIt = GetIt.instance;

  ThemeData _buildTheme(final brightness) {
    final baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(final BuildContext context) => MaterialApp.router(
        title: "Nazar Lenyk",
        theme: _buildTheme(Brightness.light),
        routerConfig: _router.config(),
        debugShowCheckedModeBanner: false,
     //   routeInformationParser: SubdomainParser(),
      );
}

class SubdomainParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    final subdomain = uri.host.split('.')[0];
    // You can perform additional checks or transformations based on the subdomain
    return subdomain;
  }

  @override
  RouteInformation restoreRouteInformation(String configuration) {
    // Implement this if you need to restore RouteInformation
    throw UnimplementedError();
  }
}
