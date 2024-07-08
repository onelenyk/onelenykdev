import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykco/app/features/main/data/profile/profile_item.dart";
import "package:onelenykco/app/features/main/screen/tgchannel/tg_state.dart";
import "package:onelenykco/app/features/main/screen/tgchannel/what_is_it.dart";
import "package:screenshot/screenshot.dart";

import "gradle_post.dart";
import "kotlincli_post.dart";

class TgCubit extends Cubit<TgState> {
  TgCubit()
      : super(TgState(
          items: [
            gradlepost1,
            gradlepost2,
            gradlepost3,
            kotlinclipost1,
            kotlinclipost2,
            kotlinclipost3,
          ],
          selectedItem: gradlepost1,
        ));

  Future<void> selectItem(final WhatIsItModel item) async {
    emit(state.copyWith(selectedItem: item));
  }

  Future<void> updateItem(final WhatIsItModel updatedItem) async {
    final updatedItems = state.items
        .map((final item) => item == state.selectedItem ? updatedItem : item)
        .toList();
    emit(state.copyWith(
      items: updatedItems,
      selectedItem: updatedItem,
    ));
  }
}
