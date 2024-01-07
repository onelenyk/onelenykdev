import "package:cloud_firestore/cloud_firestore.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykco/app/features/main/data/topic/topic_content.dart";

part "topic_item.freezed.dart";
part "topic_item.g.dart";


@freezed
class TopicItem with _$TopicItem {
  factory TopicItem({
    required final String? id,
    @TimestampSerializer() required final DateTime? date,
    required final TopicContent? content,
  }) = _TopicItem;

  factory TopicItem.fromJson(final Map<String, dynamic> json) => _$TopicItemFromJson(json);
  TopicItem._(); // Private constructor for freezed
}

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(final timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(final DateTime date) => Timestamp.fromDate(date);
}