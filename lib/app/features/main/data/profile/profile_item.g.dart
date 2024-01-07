// GENERATED CODE - DO NOT MODIFY BY HAND

part of "profile_item.dart";

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileItemImpl _$$ProfileItemImplFromJson(final Map<String, dynamic> json) =>
    _$ProfileItemImpl(
      id: json["id"] as String?,
      title: json["title"] as String,
      role: json["role"] as String,
      location: json["location"] as String,
      firstName: json["firstName"] as String,
      lastName: json["lastName"] as String,
      age: json["age"] as String,
      description: json["description"] as String,
      languages:
          (json["languages"] as List<dynamic>).map((final e) => e as String).toList(),
      skills:
          (json["skills"] as List<dynamic>).map((final e) => e as String).toList(),
      experience: (json["experience"] as List<dynamic>)
          .map((final e) => ExperienceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProfileItemImplToJson(final _$ProfileItemImpl instance) =>
    <String, dynamic>{
      "id": instance.id,
      "title": instance.title,
      "role": instance.role,
      "location": instance.location,
      "firstName": instance.firstName,
      "lastName": instance.lastName,
      "age": instance.age,
      "description": instance.description,
      "languages": instance.languages,
      "skills": instance.skills,
      "experience": instance.experience.map((final e) => e.toJson()).toList(),
    };
