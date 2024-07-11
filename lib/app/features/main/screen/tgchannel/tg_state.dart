import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykdev/app/features/main/data/profile/profile_item.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/what_is_it.dart";
import "package:screenshot/screenshot.dart";

import "gradle_post.dart";

part "tg_state.freezed.dart";

@freezed
class TgState with _$TgState{
  factory TgState({
    required final List<WhatIsItModel> items,
    required final WhatIsItModel? selectedItem,
  }) = _TgState;

  TgState._(); // Private constructor for freezed
}


