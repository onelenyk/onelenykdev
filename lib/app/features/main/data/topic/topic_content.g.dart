// GENERATED CODE - DO NOT MODIFY BY HAND

part of "topic_content.dart";

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicDataItemImpl _$$TopicDataItemImplFromJson(final Map<String, dynamic> json) =>
    _$TopicDataItemImpl(
      date: json["date"] as int,
      text: json["text"] as String,
    );

Map<String, dynamic> _$$TopicDataItemImplToJson(final _$TopicDataItemImpl instance) =>
    <String, dynamic>{
      "date": instance.date,
      "text": instance.text,
    };

_$TopicContentImpl _$$TopicContentImplFromJson(final Map<String, dynamic> json) =>
    _$TopicContentImpl(
      title: json["title"] as String?,
      data: (json["data"] as List<dynamic>)
          .map((final e) => TopicDataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TopicContentImplToJson(final _$TopicContentImpl instance) =>
    <String, dynamic>{
      "title": instance.title,
      "data": instance.data.map((final e) => e.toJson()).toList(),
    };
