import "package:cloud_firestore/cloud_firestore.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:intl/intl.dart";
import "package:onelenykco/app/features/main/data/profile/education_item.dart";
import "package:onelenykco/app/features/main/data/profile/employment_item.dart";

import "../../common/timestamp_serializer.dart";

part "user_payload.freezed.dart";

part "user_payload.g.dart";

@freezed
class Tap with _$Tap {
  factory Tap({
    required final String id,
    @TimestampSerializer2() required final Timestamp tapDate,
  }) = _Tap;

  Tap._();

  String formatDateTime(final DateTime dateTime) {
    // Define the desired date format
    final formatter = DateFormat.yMMMMd("en_US").add_jm();

    // Format the DateTime using the defined format
    return formatter.format(dateTime);
  }


  String get formattedDate => formatDateTime(tapDate.toDate());

  factory Tap.fromJson(final Map<String, dynamic> json) => _$TapFromJson(json);
}

@freezed
class UserPayload with _$UserPayload {
  factory UserPayload({
    required final String? id,
    required final String? uid,
    required final List<Tap> taps,
  }) = _UserPayload;

  factory UserPayload.fromJson(final Map<String, dynamic> json) =>
      _$UserPayloadFromJson(json);

  factory UserPayload.fromSnapshot(final DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;

    final userFromJson = UserPayload.fromJson(data);

    final tapp = userFromJson.taps
        .asMap()
        .entries
        .map((entry) =>
            Tap(id: entry.key.toString(), tapDate: entry.value.tapDate))
        .toList();
    return userFromJson.copyWith(id: snapshot.id, taps: tapp);
  }

  UserPayload._();
}
