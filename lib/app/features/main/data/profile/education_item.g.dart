// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationItemImpl _$$EducationItemImplFromJson(Map<String, dynamic> json) =>
    _$EducationItemImpl(
      universityName: json['universityName'] as String,
      role: json['role'] as String,
      startDate: const TimestampSerializer2()
          .fromJson((json['startDate'] as num).toInt()),
      endDate: const NullableTimestampSerializer()
          .fromJson((json['endDate'] as num?)?.toInt()),
    );

Map<String, dynamic> _$$EducationItemImplToJson(_$EducationItemImpl instance) =>
    <String, dynamic>{
      'universityName': instance.universityName,
      'role': instance.role,
      'startDate': const TimestampSerializer2().toJson(instance.startDate),
      'endDate': const NullableTimestampSerializer().toJson(instance.endDate),
    };
