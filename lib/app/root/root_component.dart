import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_router.dart';
import '../features/passwords/state/passwords_cubit.dart';

class RootComponent extends StatelessWidget {
  final _router = AppRouter();
  final getIt = GetIt.instance;

  RootComponent() {
      getIt.registerSingleton<PasswordsCubit>(PasswordsCubit());
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
      title: 'onelenyk.co',
      theme: _buildTheme(Brightness.light),
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
