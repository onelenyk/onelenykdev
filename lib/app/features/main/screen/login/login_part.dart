import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:onelenykco/app/features/main/data/state/main_cubit.dart';

import "dart:math" as math;
import "../../../../common/hover_button.dart";
import "../../../../data/firebase/auth_cubit.dart";
import "../../../../data/firebase/authentication_state.dart";

class LoginPart extends StatelessWidget {

  LoginPart({super.key});
  final getIt = GetIt.instance;

  String extractTwoSymbols(final String input) {
    var words = input.split(" ");

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

/*  void navigateToAdmin() {
    final cubit = getIt<MainCubit>();
    cubit.selectTopic(topic: adminItem);
  }*/

  Future<void> showLogoutDialog(final BuildContext context, final User user) async => showDialog<void>(
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
            TextButton(
              child: const Text("Admin pannel"),
              onPressed: () {
                // Implement your log out logic here
                Navigator.of(dialogContext).pop(); // Dismiss the dialog

              },
            ),
          ],
        ),
    );

  @override
  Widget build(final BuildContext context) {
    final authCubit = getIt<AuthenticationCubit>();

    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      bloc: authCubit,
      listener: (final context, final state) {
        if (state is AuthenticationSuccess) {
          print("AuthenticationSuccess ${state.user}");
          // Navigate to home screen
        } else if (state is AuthenticationFailure) {
          print("AuthenticationFailure ${state.error}");
        }
      },
      builder: (final context, final state) {
        if (state is AuthenticationLoading) {
          return HoverButton(
            onTap: () {},
            onDoubleTap: () {},
            hoverColor: Colors.yellow.shade200,
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,

                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        } else if (state is AuthenticationInitial) {
          return HoverButton(
            onTap: () {
              showLoginDialog(context);
            },
            onDoubleTap: () {},
            hoverColor: Colors.grey.shade400,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                FontAwesomeIcons.arrowRightToBracket,
                color: Colors.white,
                size: 20,
              ),
            ),
          );
        } else if (state is AuthenticationFailure) {
          return HoverButton(
            onTap: () {
              showLoginDialog(context);
            },
            onDoubleTap: () {},
            hoverColor: Colors.yellow.shade200,

            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.cancel,
                color: Colors.white,
                size: 20,
              ),
            ),
          );
        } else if (state is AuthenticationSuccess) {
          var title = extractTwoSymbols(
                  state.user?.displayName ?? state.user?.email ?? "",)
              .toUpperCase();

          final random = math.Random();
          final color =
              Colors.primaries[random.nextInt(Colors.primaries.length)];

          return Column(
            children: [
              HoverButton(
                onTap: () {
                  showLogoutDialog(context, state.user!);
                },
                onDoubleTap: () {},
                hoverColor: Colors.yellow.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return HoverButton(
            onTap: () {},
            onDoubleTap: () {},
            hoverColor: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
