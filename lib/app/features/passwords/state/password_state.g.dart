// GENERATED CODE - DO NOT MODIFY BY HAND

part of "password_state.dart";

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPasswordsState _$MyPasswordsStateFromJson(final Map<String, dynamic> json) =>
    MyPasswordsState(
      passwords: (json["passwords"] as List<dynamic>)
          .map((final e) => PasswordItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchQuery: json["searchQuery"] as String,
    );

Map<String, dynamic> _$MyPasswordsStateToJson(final MyPasswordsState instance) =>
    <String, dynamic>{
      "passwords": instance.passwords.map((final e) => e.toJson()).toList(),
      "searchQuery": instance.searchQuery,
    };
