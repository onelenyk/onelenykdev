import 'package:flutter_dotenv/flutter_dotenv.dart';

// DotEnv dotenv = DotEnv() is automatically called during import.
// If you want to load multiple dotenv files or name your dotenv object differently, you can do the following and import the singleton into the relavant files:
// DotEnv another_dotenv = DotEnv()

Future<void> environmentInit() async {
  return await dotenv.load(fileName: "dotenv.env");
}

String? getGithubToken() {
  return dotenv.env['githubToken'];
}

String? getGithubLogin() {
  return dotenv.env['login'];
}

String? getGithubRepository() {
  return dotenv.env['repository'];
}


