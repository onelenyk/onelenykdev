import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/root/root_component.dart';
import 'firebase_options.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  usePathUrlStrategy();
  runApp(RootComponent());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
