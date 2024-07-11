import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykdev/app/features/main/data/topic/topic_item.dart";
import "package:onelenykdev/app/features/main/screen/munera/scenario/scenario_state.dart";

part 'personal_state.freezed.dart';

@freezed
class PersonalState with _$PersonalState {
  factory PersonalState({
    required final ScenarioState activeScenario,
    required final bool isLoading,
  }) = _PersonalState;

  PersonalState._();
}
