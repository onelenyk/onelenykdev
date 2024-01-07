import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onelenykco/app/data/firebase/auth_cubit.dart';
import 'package:onelenykco/app/data/repository/profile_repository.dart';
import 'package:onelenykco/app/features/main/data/state/main_cubit.dart';
import 'package:onelenykco/main.dart';

import '../data/repository/topics_repository.dart';
import '../features/main/data/admin/admin_cubit.dart';
import '../features/main/data/resume/resume_cubit.dart';
import 'app_router.dart';
import '../data/services/firestore_service.dart';

class RootComponent extends StatelessWidget {
  final _router = AppRouter();
  final getIt = GetIt.instance;

  RootComponent() {
  //  getIt.registerSingleton<ProfileRepository>(ProfileRepository());
    getIt.registerSingleton<TopicsRepository>(TopicsRepository());
    getIt.registerSingleton<FirestoreService>(FirestoreService());

    getIt.registerSingleton<MainCubit>(MainCubit());
    getIt.registerSingleton<AdminCubit>(AdminCubit());
    getIt.registerSingleton<ResumeCubit>(ResumeCubit());

    getIt.registerSingleton<AuthenticationCubit>(AuthenticationCubit(firebaseAuth));

  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nazar Lenyk',
      theme: _buildTheme(Brightness.light),
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
