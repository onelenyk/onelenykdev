import "package:cloud_firestore/cloud_firestore.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import 'package:onelenykco/app/features/main/data/topic/topic_content.dart';

import "package:cloud_firestore/cloud_firestore.dart";
import "package:json_annotation/json_annotation.dart";

import "../../../../common/timestamp_serializer.dart";

part "employment_item.freezed.dart";
part "employment_item.g.dart";


@freezed
class ExperienceItem with _$ExperienceItem {
  factory ExperienceItem({
    required final String name,
    required final String id,
    required final String role,
    @TimestampSerializer2() required final Timestamp startDate,
    @NullableTimestampSerializer() required final Timestamp? endDate,
    required final List<String> description,
  }) = _ExperienceItem;

  factory ExperienceItem.fromJson(final Map<String, dynamic> json) => _$ExperienceItemFromJson(json);
  ExperienceItem._(); // Private constructor for freezed
}
