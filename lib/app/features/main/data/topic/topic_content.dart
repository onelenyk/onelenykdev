import 'package:freezed_annotation/freezed_annotation.dart';
part 'topic_content.freezed.dart';
part 'topic_content.g.dart';

@freezed
class TopicDataItem with _$TopicDataItem {
  factory TopicDataItem({
    required int date,
    required String text,
  }) = _TopicDataItem;

  factory TopicDataItem.fromJson(Map<String, dynamic> json) => _$TopicDataItemFromJson(json);
}

@freezed
class TopicContent with _$TopicContent {
  factory TopicContent({
    required String? title,
    required List<TopicDataItem> data,
  }) = _TopicContent;

  factory TopicContent.fromJson(Map<String, dynamic> json) => _$TopicContentFromJson(json);
  TopicContent._(); // Private constructor for freezed
}