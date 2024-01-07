import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onelenykco/app/features/main/data/state/main_cubit.dart';

import 'dart:math' as math;
import '../../../../common/hover_button.dart';
import '../../../../data/firebase/auth_cubit.dart';
import '../../../../data/firebase/authentication_state.dart';

class LoginPart extends StatelessWidget {
  final getIt = GetIt.instance;

  LoginPart({super.key});

  String extractTwoSymbols(String input) {
    var words = input.split(' ');

    if (words.length >= 2) {
      return words[0][0] + words[1][0];
    } else if (input.isNotEmpty) {
      return input.length > 1
          ? input[0] + input[input.length - 1]
          : input[0] * 2;
    } else {
      return '';
    }
  }

  Future<void> showLoginDialog(BuildContext context) async {
    final authCubit = getIt<AuthenticationCubit>();

    String email = '';
    String password = '';

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button to close the dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Login'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Login'),
              onPressed: () {
                // Implement your login logic here
                authCubit.signInWithEmailAndPassword(email, password);
                print('Email: $email, Password: $password');
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

/*  void navigateToAdmin() {
    final cubit = getIt<MainCubit>();
    cubit.selectTopic(topic: adminItem);
  }*/

  Future<void> showLogoutDialog(BuildContext context, User user) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button to close the dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Logged In'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You are already logged in.'),
                Text('Email: ${user.email}'),
                Text('Name: ${user.displayName ?? 'N/A'}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Log Out'),
              onPressed: () {
                // Implement your log out logic here
                final authCubit = getIt<AuthenticationCubit>();
                authCubit.signOut();
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Admin pannel'),
              onPressed: () {
                // Implement your log out logic here
                Navigator.of(dialogContext).pop(); // Dismiss the dialog

              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = getIt<AuthenticationCubit>();

    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      bloc: authCubit,
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          print("AuthenticationSuccess ${state.user}");
          // Navigate to home screen
        } else if (state is AuthenticationFailure) {
          print("AuthenticationFailure ${state.error}");
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return HoverButton(
            onTap: () {},
            onDoubleTap: () {},
            hoverColor: Colors.yellow.shade200,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
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

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.cancel,
                color: Colors.white,
                size: 20,
              ),
            ),
          );
        } else if (state is AuthenticationSuccess) {
          var title = extractTwoSymbols(
                  state.user?.displayName ?? state.user?.email ?? "")
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
                  padding: const EdgeInsets.all(8.0),
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
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
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
