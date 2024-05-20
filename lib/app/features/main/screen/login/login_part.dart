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
              style: GoogleFonts.vt323(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              onChanged: (final value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: GoogleFonts.vt323(
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2,
                ),
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
              style: GoogleFonts.vt323(
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2),
              onChanged: (final value) {
                password = value;
              },
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.vt323(
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2,
                ),
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
                      style: GoogleFonts.vt323(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      )),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              HoverButton(
                onTap: () {
                  authCubit.signInWithEmailAndPassword(email, password);
                  print("Email: $email, Password: $password");
                },
                onDoubleTap: () {},
                hoverColor: Colors.white10,
                color: Colors.black26.withAlpha(30),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Login",
                      style: GoogleFonts.vt323(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      )),
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

  Future<void> showLoginDialog(final BuildContext context) async {
    final authCubit = getIt<AuthenticationCubit>();

    var email = "";
    var password = "";

    return showDialog<void>(
      context: context,
      builder: (final dialogContext) => AlertDialog(
        title: const Text("Login"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                onChanged: (final value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                onChanged: (final value) {
                  password = value;
                },
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Dismiss the dialog
            },
          ),
          TextButton(
            child: const Text("Login"),
            onPressed: () {
              // Implement your login logic here
              authCubit.signInWithEmailAndPassword(email, password);
              print("Email: $email, Password: $password");
              Navigator.of(dialogContext).pop(); // Dismiss the dialog
            },
          ),
        ],
      ),
    );
  }

  Future<void> showLogoutDialog(
          final BuildContext context, final User user) async =>
      showDialog<void>(
        context: context,
        builder: (final dialogContext) => AlertDialog(
          title: const Text("Logged In"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text("You are already logged in."),
                Text("Email: ${user.email}"),
                Text('Name: ${user.displayName ?? 'N/A'}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Log Out"),
              onPressed: () {
                // Implement your log out logic here
                final authCubit = getIt<AuthenticationCubit>();
                authCubit.signOut();
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
            /*   TextButton(
              child: const Text("Admin pannel"),
              onPressed: () {
                // Implement your log out logic here
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),*/
          ],
        ),
      );

  var showLogin = false;

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
                clickable: !state.loginOpened,
                color: Colors.black.withAlpha(30),
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
            color: Colors.black.withAlpha(30),
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
            color: Colors.black.withAlpha(30),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: SizedBox(
                  height: 20,
                  child: Text(
                    "Logout",
                    style: GoogleFonts.vt323(
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
            color: Colors.black.withAlpha(30),
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
                    height: 8,
                  ),
                  DividerWidget(),
                  SizedBox(
                    height: 8,
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
