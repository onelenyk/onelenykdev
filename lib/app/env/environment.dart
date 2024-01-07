import "package:flutter_dotenv/flutter_dotenv.dart";

// DotEnv dotenv = DotEnv() is automatically called during import.
// If you want to load multiple dotenv files or name your dotenv object differently, you can do the following and import the singleton into the relavant files:
// DotEnv another_dotenv = DotEnv()

Future<void> environmentInit() async => await dotenv.load(fileName: "dotenv.env");

String? getGithubToken() => dotenv.env["githubToken"];

String? getGithubLogin() => dotenv.env["login"];

String? getGithubRepository() => dotenv.env["repository"];


