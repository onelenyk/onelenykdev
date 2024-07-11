// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TapImpl _$$TapImplFromJson(Map<String, dynamic> json) => _$TapImpl(
      id: json['id'] as String,
      tapDate: const TimestampSerializer2()
          .fromJson((json['tapDate'] as num).toInt()),
    );

Map<String, dynamic> _$$TapImplToJson(_$TapImpl instance) => <String, dynamic>{
      'id': instance.id,
      'tapDate': const TimestampSerializer2().toJson(instance.tapDate),
    };

_$UserPayloadImpl _$$UserPayloadImplFromJson(Map<String, dynamic> json) =>
    _$UserPayloadImpl(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      taps: (json['taps'] as List<dynamic>)
          .map((e) => Tap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserPayloadImplToJson(_$UserPayloadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'taps': instance.taps.map((e) => e.toJson()).toList(),
    };
