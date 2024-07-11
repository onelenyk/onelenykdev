import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykdev/app/data/firebase/auth_cubit.dart";
import "package:onelenykdev/app/data/repository/topics_repository.dart";
import "package:onelenykdev/app/data/services/firestore_service.dart";
import "package:onelenykdev/app/features/main/data/admin/admin_cubit.dart";
import "package:onelenykdev/app/features/main/data/resume/resume_cubit.dart";
import "package:onelenykdev/app/features/main/data/state/main_cubit.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/tg_channel.dart";
import "package:onelenykdev/app/root/app_router.dart";
import "package:onelenykdev/main.dart";

import "../data/repository/user_payload_repository.dart";
import "../data/repository/user_repository.dart";
import "../features/main/screen/munera/personal_cubit.dart";
import "../features/main/screen/projects/timeline_cubit.dart";
import "../features/main/screen/tgchannel/tg_cubit.dart";
import "../features/main/screen/tgchannel/tg_state.dart";

class RootComponent extends StatelessWidget {
  RootComponent({super.key}) {
    //  getIt.registerSingleton<ProfileRepository>(ProfileRepository());
    getIt
      ..registerSingleton<TopicsRepository>(TopicsRepository())
      ..registerSingleton<FirestoreService>(FirestoreService())
      ..registerSingleton<MainCubit>(MainCubit())
      ..registerSingleton<TgCubit>(TgCubit())
      ..registerSingleton<AdminCubit>(AdminCubit())
      ..registerSingleton<TimelineCubit>(TimelineCubit())
      ..registerSingleton<ResumeCubit>(ResumeCubit())
      ..registerSingleton<AuthenticationCubit>(AuthenticationCubit(firebaseAuth))
      ..registerSingleton<PersonalCubit>(PersonalCubit())
      ..registerSingleton<UserRepository>(UserRepository())
      ..registerSingleton<UserPayloadRepository>(UserPayloadRepository()
        ,);
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
      final RouteInformation routeInformation,) async {
    final uri = Uri.parse(routeInformation.location);
    final subdomain = uri.host.split(".")[0];
    // You can perform additional checks or transformations based on the subdomain
    return subdomain;
  }

  @override
  RouteInformation restoreRouteInformation(final String configuration) {
    // Implement this if you need to restore RouteInformation
    throw UnimplementedError();
  }
}
