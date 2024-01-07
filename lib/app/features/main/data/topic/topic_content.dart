import "package:freezed_annotation/freezed_annotation.dart";
part "topic_content.freezed.dart";
part "topic_content.g.dart";

@freezed
class TopicDataItem with _$TopicDataItem {
  factory TopicDataItem({
    required final int date,
    required final String text,
  }) = _TopicDataItem;

  factory TopicDataItem.fromJson(final Map<String, dynamic> json) => _$TopicDataItemFromJson(json);
}

@freezed
class TopicContent with _$TopicContent {
  factory TopicContent({
    required final String? title,
    required final List<TopicDataItem> data,
  }) = _TopicContent;

  factory TopicContent.fromJson(final Map<String, dynamic> json) => _$TopicContentFromJson(json);
  TopicContent._(); // Private constructor for freezed
}