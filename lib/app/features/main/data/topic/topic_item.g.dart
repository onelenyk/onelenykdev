// GENERATED CODE - DO NOT MODIFY BY HAND

part of "topic_item.dart";

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicItemImpl _$$TopicItemImplFromJson(final Map<String, dynamic> json) =>
    _$TopicItemImpl(
      id: json["id"] as String?,
      date: const TimestampSerializer().fromJson(json["date"]),
      content: json["content"] == null
          ? null
          : TopicContent.fromJson(json["content"] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TopicItemImplToJson(final _$TopicItemImpl instance) =>
    <String, dynamic>{
      "id": instance.id,
      "date": _$JsonConverterToJson<dynamic, DateTime>(
          instance.date, const TimestampSerializer().toJson,),
      "content": instance.content?.toJson(),
    };

Json? _$JsonConverterToJson<Json, Value>(
  final Value? value,
  final Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
