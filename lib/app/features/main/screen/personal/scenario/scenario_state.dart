
import "package:firebase_auth/firebase_auth.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykco/app/data/user/user_payload.dart";

part 'scenario_state.freezed.dart';

/*
@freezed
abstract class ScenarioState with _$ScenarioState {
  const factory ScenarioState.main(final User? user, final UserPayload? payload) = MainState;
}
*/


@freezed
class ScenarioState with _$ScenarioState {
  factory ScenarioState({
    required final User? user,
    required final UserPayload? payload,
  }) = _ScenarioState;

  ScenarioState._();
}
