import "package:cloud_firestore/cloud_firestore.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykco/app/features/main/data/profile/education_item.dart";
import "package:onelenykco/app/features/main/data/profile/employment_item.dart";

import "../../common/timestamp_serializer.dart";

part "user_payload.freezed.dart";
part "user_payload.g.dart";

@freezed
class UserPayload with _$UserPayload {
  factory UserPayload({
    required final String? id,
    required final String? uid,
    @TimestampSerializer2() required final Timestamp lastClickDate,
  }) = _UserPayload;

  factory UserPayload.fromJson(final Map<String, dynamic> json) => _$UserPayloadFromJson(json);

  factory UserPayload.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return UserPayload(
      id: snapshot.id,
      uid: data["uid"] as String,
      lastClickDate: data["lastClickDate"] as Timestamp,
    );
  }
  UserPayload._();

}
