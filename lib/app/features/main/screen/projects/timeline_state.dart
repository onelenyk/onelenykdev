import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykco/app/features/main/data/topic/topic_item.dart";
import "package:onelenykco/app/features/main/screen/munera/scenario/scenario_state.dart";

part 'timeline_state.freezed.dart';

@freezed
class TimelineState with _$TimelineState {
  factory TimelineState({
    required final bool reversed,
  }) = _TimelineState;

  TimelineState._();
}
