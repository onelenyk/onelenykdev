import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onelenykco/app/features/main/data/topic/topic_content.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/timestamp_serializer.dart';

part 'education_item.freezed.dart';
part 'education_item.g.dart';

@freezed
class EducationItem with _$EducationItem {
  factory EducationItem({
    required String universityName,
    required String role,
    @TimestampSerializer() required DateTime startDate,
    @TimestampSerializerNullable() required DateTime? endDate,
  }) = _EducationItem;

  factory EducationItem.fromJson(Map<String, dynamic> json) => _$EducationItemFromJson(json);
  EducationItem._(); // Private constructor for freezed
}
