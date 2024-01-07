import "package:freezed_annotation/freezed_annotation.dart";
import "package:timeago/timeago.dart";

part "commit_model.freezed.dart";
part "commit_model.g.dart";

@freezed
class Commit with _$Commit {
  factory Commit({
    required final String sha,
    required final CommitData commit,
  }) = _Commit;

  factory Commit.fromJson(final Map<String, dynamic> json) => _$CommitFromJson(json);
}

@freezed
class CommitData with _$CommitData {
  factory CommitData({
    required final Committer committer,
    required final String message,
  }) = _CommitData;

  factory CommitData.fromJson(final Map<String, dynamic> json) => _$CommitDataFromJson(json);
}

@freezed
class Committer with _$Committer {
  factory Committer({
    required final String date,
  }) = _Committer;

  factory Committer.fromJson(final Map<String, dynamic> json) => _$CommitterFromJson(json);
  const Committer._();

  String get formatedDate => format(DateTime.parse(date));
}
