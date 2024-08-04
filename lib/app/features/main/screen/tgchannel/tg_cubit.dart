import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:onelenykdev/app/features/main/data/profile/profile_item.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/tg_state.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/what_is_it.dart";
import "package:screenshot/screenshot.dart";
import "package:uuid/uuid.dart";

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
            kotlinclipost4,
          ],
          selectedItem: gradlepost1,
        ));

  final uuid = const Uuid();

  Future<void> createItem() async {
    final model = WhatIsItModel.defaultValues(id: uuid.v4()).copyWith(topicName: "Testing");
    final newList = state.items;

    final list = List.of(state.items)
        ..add(model);
    emit(state.copyWith(items: list));
  }

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
