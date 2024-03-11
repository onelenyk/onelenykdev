import "dart:math";

import "package:bloc/bloc.dart";
import "package:get_it/get_it.dart";
import "package:markdown/markdown.dart" as mark;
import "package:onelenykco/app/features/main/data/state/main_state.dart";
import "package:onelenykco/app/features/main/data/state/routes.dart";
import "package:package_info_plus/package_info_plus.dart";

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(
      MainState(activeRoute: Routes.Design, isMenuOpened: false, emoji: null, version:"initial"),) {
    loadVersion();
    loadEmoji();
  }


  final getIt = GetIt.instance;

  void selectTopic({required final Routes route}) {
    emit(state.copyWith(activeRoute: route, isMenuOpened: false));
  }

  Future<void> openMenu() async {
    emit(state.copyWith(isMenuOpened: !state.isMenuOpened));
  }

  Future<void> loadEmoji() async {
    final emoji = List.generate(1, (final index) => _getEmoji()).join();
    emit(state.copyWith(emoji: emoji));
  }
  Future<void> loadVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final version = packageInfo.version;
      final buildNumber = packageInfo.buildNumber;

      emit(state.copyWith(version: version));

    } catch (e) {
      print("Error loading version: $e");
    }
  }

  // Function to get a random ID from the list
  String _getRandomId(final List<String> ids) => ids[Random().nextInt(ids.length)];

  String _getEmoji() {
    const emojis = mark.emojis;
    final randomId = _getRandomId(emojis.keys.toList());
    final randomEmoji = emojis[randomId] ?? "❓";
    return randomEmoji;
  }

}
