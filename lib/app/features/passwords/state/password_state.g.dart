// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPasswordsState _$MyPasswordsStateFromJson(Map<String, dynamic> json) =>
    MyPasswordsState(
      passwords: (json['passwords'] as List<dynamic>)
          .map((e) => PasswordItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchQuery: json['searchQuery'] as String,
    );

Map<String, dynamic> _$MyPasswordsStateToJson(MyPasswordsState instance) =>
    <String, dynamic>{
      'passwords': instance.passwords,
      'searchQuery': instance.searchQuery,
    };
