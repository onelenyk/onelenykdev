import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onelenykco/app/features/main/data/topic/topic_content.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';


part 'topic_item.freezed.dart';
part 'topic_item.g.dart';


@freezed
class TopicItem with _$TopicItem {
  factory TopicItem({
    required String? id,
    @TimestampSerializer() required DateTime? date,
    required TopicContent? content,
  }) = _TopicItem;

  factory TopicItem.fromJson(Map<String, dynamic> json) => _$TopicItemFromJson(json);
  TopicItem._(); // Private constructor for freezed
}

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}