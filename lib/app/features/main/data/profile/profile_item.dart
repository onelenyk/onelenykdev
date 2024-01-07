import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onelenykco/app/features/main/data/topic/topic_content.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/timestamp_serializer.dart';
import 'employment_item.dart';

part 'profile_item.freezed.dart';
part 'profile_item.g.dart';

@freezed
class ProfileItem with _$ProfileItem {
  factory ProfileItem({
    required String? id,
    required String title,
    required String role,
    required String location,
    required String firstName,
    required String lastName,
    required String age,
    required String description,
    required List<String> languages,
    required List<String> skills,
    required List<ExperienceItem> experience,
  }) = _ProfileItem;

  String get name {
    return "$firstName $lastName";
  }

  factory ProfileItem.fromJson(Map<String, dynamic> json) => _$ProfileItemFromJson(json);
  ProfileItem._(); // Private constructor for freezed
}
