import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onelenykco/app/features/main/data/topic/topic_content.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/timestamp_serializer.dart';

part 'employment_item.freezed.dart';
part 'employment_item.g.dart';


@freezed
class ExperienceItem with _$ExperienceItem {
  factory ExperienceItem({
    required String name,
    required String id,
    required String role,
    @TimestampSerializer() required DateTime startDate,
    @TimestampSerializerNullable() required DateTime? endDate,
    required List<String> description,
  }) = _ExperienceItem;

  factory ExperienceItem.fromJson(Map<String, dynamic> json) => _$ExperienceItemFromJson(json);
  ExperienceItem._(); // Private constructor for freezed
}
