import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/env/environment.dart';
import 'app/root/root_component.dart';
import 'firebase_options.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

late final FirebaseApp firebaseApp;
late final FirebaseAuth firebaseAuth;

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
