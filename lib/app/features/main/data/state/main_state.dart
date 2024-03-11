import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykco/app/features/main/data/state/routes.dart";

part "main_state.freezed.dart";

@freezed
class MainState with _$MainState {
  factory MainState({
    required final Routes activeRoute,

    required final bool isMenuOpened,

    required final String? emoji,
    required final String? version,
  }) = _MainState;

  MainState._(); // Private constructor for freezed
}
