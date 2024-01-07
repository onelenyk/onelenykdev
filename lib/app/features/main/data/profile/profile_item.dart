import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykco/app/features/main/data/profile/employment_item.dart";

part "profile_item.freezed.dart";
part "profile_item.g.dart";

@freezed
class ProfileItem with _$ProfileItem {
  factory ProfileItem({
    required final String? id,
    required final String title,
    required final String role,
    required final String location,
    required final String firstName,
    required final String lastName,
    required final String age,
    required final String description,
    required final List<String> languages,
    required final List<String> skills,
    required final List<ExperienceItem> experience,
  }) = _ProfileItem;

  factory ProfileItem.fromJson(final Map<String, dynamic> json) => _$ProfileItemFromJson(json);
  ProfileItem._();

  String get name => "$firstName $lastName"; // Private constructor for freezed
}
