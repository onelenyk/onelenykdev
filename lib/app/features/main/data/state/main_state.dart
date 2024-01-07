import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onelenykco/app/features/main/data/state/routes.dart';

import '../topic/topic_item.dart';


part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  factory MainState({
    required Routes activeRoute,

    required bool isMenuOpened
  }) = _MainState;

  MainState._(); // Private constructor for freezed
}
