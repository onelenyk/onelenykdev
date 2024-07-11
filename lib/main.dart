import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_web_plugins/url_strategy.dart";

import "package:onelenykdev/app/env/environment.dart";
import "package:onelenykdev/app/root/root_component.dart";
import "package:onelenykdev/firebase_options.dart";

///Public firebase
late final FirebaseApp firebaseApp;
///Public firebase
late final FirebaseAuth firebaseAuth;
final bool isProduction = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await environmentInit();
  firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  firebaseAuth = FirebaseAuth.instanceFor(app: firebaseApp);

  runApp(RootComponent());
}
