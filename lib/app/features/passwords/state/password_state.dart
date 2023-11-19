import 'package:freezed_annotation/freezed_annotation.dart';

import '../password.dart';

part 'password_state.freezed.dart';
part 'password_state.g.dart';


@freezed
@JsonSerializable()
class MyPasswordsState with _$MyPasswordsState {
  factory MyPasswordsState({
    required List<PasswordItem> passwords,
    required String searchQuery,
  }) = _MyPasswordsState;

  MyPasswordsState._(); // Private constructor for freezed

  List<PasswordItem> get uiPasswords => passwords
      .where((passwordItem) => matchesSearchQuery(passwordItem))
      .toList();

  bool matchesSearchQuery(PasswordItem passwordItem) {
    return passwordItem.service.contains(searchQuery);
  }
}