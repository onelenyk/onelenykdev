import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykco/app/features/main/data/profile/profile_item.dart";


part "resume_state.freezed.dart";

@freezed
class ResumeState with _$ResumeState {
  factory ResumeState({
    required final ProfileItem profile,
  }) = _ResumeState;

  ResumeState._(); // Private constructor for freezed
}
