// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperienceItemImpl _$$ExperienceItemImplFromJson(Map<String, dynamic> json) =>
    _$ExperienceItemImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      role: json['role'] as String,
      startDate: const TimestampSerializer2()
          .fromJson((json['startDate'] as num).toInt()),
      endDate: const NullableTimestampSerializer()
          .fromJson((json['endDate'] as num?)?.toInt()),
      description: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ExperienceItemImplToJson(
        _$ExperienceItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'role': instance.role,
      'startDate': const TimestampSerializer2().toJson(instance.startDate),
      'endDate': const NullableTimestampSerializer().toJson(instance.endDate),
      'description': instance.description,
    };
