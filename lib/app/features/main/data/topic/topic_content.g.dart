// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicDataItemImpl _$$TopicDataItemImplFromJson(Map<String, dynamic> json) =>
    _$TopicDataItemImpl(
      date: (json['date'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$TopicDataItemImplToJson(_$TopicDataItemImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'text': instance.text,
    };

_$TopicContentImpl _$$TopicContentImplFromJson(Map<String, dynamic> json) =>
    _$TopicContentImpl(
      title: json['title'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => TopicDataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TopicContentImplToJson(_$TopicContentImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
