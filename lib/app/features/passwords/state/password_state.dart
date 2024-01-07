import "package:freezed_annotation/freezed_annotation.dart";

import "../password.dart";

part "password_state.freezed.dart";
part "password_state.g.dart";


@freezed
@JsonSerializable()
class MyPasswordsState with _$MyPasswordsState {
  factory MyPasswordsState({
    required final List<PasswordItem> passwords,
    required final String searchQuery,
  }) = _MyPasswordsState;

  MyPasswordsState._(); // Private constructor for freezed

  List<PasswordItem> get uiPasswords => passwords
      .where(matchesSearchQuery)
      .toList();

  bool matchesSearchQuery(final PasswordItem passwordItem) => passwordItem.service.contains(searchQuery);
}