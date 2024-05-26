import "dart:math" as math;

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/hover_button.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/data/firebase/auth_cubit.dart";
import "package:onelenykco/app/data/firebase/authentication_state.dart";

import "../../../../data/firebase/auth/auth_state.dart";

class LoginPart extends StatelessWidget {
  LoginPart({super.key});

  final getIt = GetIt.instance;

  String extractTwoSymbols(final String input) {
    final words = input.split(" ");

    if (words.length >= 2) {
      return words[0][0] + words[1][0];
    } else if (input.isNotEmpty) {
      return input.length > 1
          ? input[0] + input[input.length - 1]
          : input[0] * 2;
    } else {
      return "";
    }
  }

  Widget loginFormBody() {
    final authCubit = getIt<AuthenticationCubit>();

    var email = "";
    var password = "";

    return InfoBlock(
      padding: const EdgeInsets.all(8.0),
      color: Colors.black26,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              style: GoogleFonts.robotoMono(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 14),
              onChanged: (final value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: GoogleFonts.robotoMono(
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2,
                    fontSize: 12),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              style: GoogleFonts.robotoMono(
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  letterSpacing: 2),
              onChanged: (final value) {
                password = value;
              },
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.robotoMono(
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2,
                    fontSize: 12),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
              ),
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              HoverButton(
                onTap: authCubit.switchLogin,
                onDoubleTap: () {},
                hoverColor: Colors.white10,
                color: Colors.black26.withAlpha(30),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Cancel",
                      style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 12)),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              HoverButton(
                onTap: () {
                  authCubit.signInOrRegisterWithEmailAndPassword(
                      email, password);
                  print("Email: $email, Password: $password");
                },
                onDoubleTap: () {},
                hoverColor: Colors.white10,
                color: Colors.black26.withAlpha(30),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Login",
                      style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 12)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final authCubit = getIt<AuthenticationCubit>();

    return BlocConsumer<AuthenticationCubit, AuthState>(
      bloc: authCubit,
      listener: (final context, final state) {
        if (state is AuthSuccess) {
          print("AuthenticationSuccess ${state.user}");
          // Navigate to home screen
        } else if (state is AuthFailed) {
          print("AuthenticationFailure ${state.error}");

          final snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InfoBlock(
                  width: 350,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.black26.withAlpha(80),
                  child: Text(state.error ?? 'Authentication Failed',
                      style: GoogleFonts.robotoMono(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 12)),
                ),
              ],
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (final context, final state) {
        final Widget content;
        if (state is AuthInitial) {
          content = Column(
            children: [
              HoverButton(
                onTap: authCubit.switchLogin,
                onDoubleTap: () {},
                hoverColor: Colors.black26,
                color: Colors.black26,
                clickable: !state.loginOpened,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.arrowRightToBracket,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is AuthFailed) {
          content = HoverButton(
            onTap: authCubit.switchLogin,
            onDoubleTap: () {},
            hoverColor: Colors.black26,
            color: Colors.black26,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          );
        } else if (state is AuthSuccess) {
          final title = extractTwoSymbols(
            state.user?.displayName ?? state.user?.email ?? "",
          ).toUpperCase();

          final random = math.Random();
          final color = Colors.white;

          content = HoverButton(
            onTap: () {
              //  showLogoutDialog(context, state.user!);
              final authCubit = getIt<AuthenticationCubit>();
              authCubit.signOut();
            },
            onDoubleTap: () {},
            hoverColor: Colors.black26,
            color: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: SizedBox(
                  height: 20,
                  child: Text(
                    "Logout",
                    style: GoogleFonts.robotoMono(
                        color: color,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              ),
            ),
          );
        } else {
          content = HoverButton(
            onTap: () {},
            onDoubleTap: () {},
            hoverColor: Colors.black26,
            color: Colors.black26,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }

        var loginOpened;

        if (state is AuthInitial) {
          loginOpened = state.loginOpened;
        } else {
          loginOpened = false;
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            content,
            Visibility(
              visible: loginOpened,
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  DividerWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  loginFormBody(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
    );
  }
}

class WidgetSwitcher extends HookWidget {
  final Widget widget1;
  final Widget widget2;
  final bool showWidget;

  WidgetSwitcher(
      {required this.widget1, required this.widget2, required this.showWidget});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          widget1,
          Visibility(
            visible: !showWidget,
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                DividerWidget(),
                SizedBox(
                  height: 8,
                ),
                widget2
              ],
            ),
          ),
          /*   AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: showWidget
                ? widget1
                : Column(
                    children: [
                      widget1,
                      SizedBox(
                        height: 8,
                      ),
                      DividerWidget(),
                      SizedBox(
                        height: 8,
                      ),
                      widget2
                    ],
                  ),
          ),*/
        ],
      ),
    );
  }
}
