// GENERATED CODE - DO NOT MODIFY BY HAND

part of "password.dart";

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PasswordItemImpl _$$PasswordItemImplFromJson(final Map<String, dynamic> json) =>
    _$PasswordItemImpl(
      id: json["id"] as String,
      service: json["service"] as String,
      password: json["password"] as String,
      login: json["login"] as String,
    );

Map<String, dynamic> _$$PasswordItemImplToJson(final _$PasswordItemImpl instance) =>
    <String, dynamic>{
      "id": instance.id,
      "service": instance.service,
      "password": instance.password,
      "login": instance.login,
    };
