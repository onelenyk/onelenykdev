// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationItemImpl _$$EducationItemImplFromJson(Map<String, dynamic> json) =>
    _$EducationItemImpl(
      universityName: json['universityName'] as String,
      role: json['role'] as String,
      startDate: const TimestampSerializer().fromJson(json['startDate']),
      endDate: const TimestampSerializerNullable().fromJson(json['endDate']),
    );

Map<String, dynamic> _$$EducationItemImplToJson(_$EducationItemImpl instance) =>
    <String, dynamic>{
      'universityName': instance.universityName,
      'role': instance.role,
      'startDate': const TimestampSerializer().toJson(instance.startDate),
      'endDate': const TimestampSerializerNullable().toJson(instance.endDate),
    };
