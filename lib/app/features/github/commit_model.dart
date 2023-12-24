import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timeago/timeago.dart';

part 'commit_model.freezed.dart';
part 'commit_model.g.dart';

@freezed
class Commit with _$Commit {
  factory Commit({
    required String sha,
    required CommitData commit,
  }) = _Commit;

  factory Commit.fromJson(Map<String, dynamic> json) => _$CommitFromJson(json);
}

@freezed
class CommitData with _$CommitData {
  factory CommitData({
    required Committer committer,
    required String message,
  }) = _CommitData;

  factory CommitData.fromJson(Map<String, dynamic> json) => _$CommitDataFromJson(json);
}

@freezed
class Committer with _$Committer {
  factory Committer({
    required String date,
  }) = _Committer;

  factory Committer.fromJson(Map<String, dynamic> json) => _$CommitterFromJson(json);
  const Committer._();

  String get formatedDate {
    return format(DateTime.parse(date));
  }
}
