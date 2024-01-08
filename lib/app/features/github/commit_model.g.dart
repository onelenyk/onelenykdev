// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommitImpl _$$CommitImplFromJson(Map<String, dynamic> json) => _$CommitImpl(
      sha: json['sha'] as String,
      commit: CommitData.fromJson(json['commit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommitImplToJson(_$CommitImpl instance) =>
    <String, dynamic>{
      'sha': instance.sha,
      'commit': instance.commit.toJson(),
    };

_$CommitDataImpl _$$CommitDataImplFromJson(Map<String, dynamic> json) =>
    _$CommitDataImpl(
      committer: Committer.fromJson(json['committer'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$CommitDataImplToJson(_$CommitDataImpl instance) =>
    <String, dynamic>{
      'committer': instance.committer.toJson(),
      'message': instance.message,
    };

_$CommitterImpl _$$CommitterImplFromJson(Map<String, dynamic> json) =>
    _$CommitterImpl(
      date: json['date'] as String,
    );

Map<String, dynamic> _$$CommitterImplToJson(_$CommitterImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
    };
