import "package:flutter/widgets.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "password.freezed.dart";
part "password.g.dart";

@freezed
class PasswordItem with _$PasswordItem {
  factory PasswordItem({
    required final String id,
    required final String service,
    required final String password,
    required final String login,
  }) = _PasswordItem;

  PasswordItem._(); // Private constructor for freezed

  factory PasswordItem.fromJson(final Map<String, Object?> json) => _$PasswordItemFromJson(json);

  IconData get serviceIcon => _getIconForService(service);

  IconData _getIconForService(final String service) {
    switch (service.toLowerCase()) {
      case "gmail":
        return FontAwesomeIcons.google;
      case "facebook":
        return FontAwesomeIcons.facebook;
      case "instagram":
        return FontAwesomeIcons.instagram;
      default:
        return FontAwesomeIcons.lock; // Default icon
    }
  }

}
