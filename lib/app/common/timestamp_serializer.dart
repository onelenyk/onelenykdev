import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

class TimestampSerializerNullable implements JsonConverter<DateTime?, dynamic> {
  const TimestampSerializerNullable();

  @override
  DateTime? fromJson(dynamic timestamp) {
    // Handle the case where timestamp is null
    if (timestamp == null) return null;
    return timestamp is Timestamp ? timestamp.toDate() : null;
  }

  @override
  dynamic toJson(DateTime? date) {
    // Handle the case where date is null
    if (date == null) return null;
    return Timestamp.fromDate(date);
  }
}

class TimestampSerializer2 implements JsonConverter<Timestamp, int> {
  const TimestampSerializer2();

  @override
  int toJson(Timestamp timestamp) => timestamp.millisecondsSinceEpoch;

  @override
  Timestamp fromJson(int millis) => Timestamp.fromMillisecondsSinceEpoch(millis);
}

class NullableTimestampSerializer implements JsonConverter<Timestamp?, int?> {
  const NullableTimestampSerializer();

  @override
  int? toJson(Timestamp? timestamp) =>
      timestamp != null ? timestamp.millisecondsSinceEpoch : null;

  @override
  Timestamp? fromJson(int? millis) =>
      millis != null ? Timestamp.fromMillisecondsSinceEpoch(millis) : null;
}