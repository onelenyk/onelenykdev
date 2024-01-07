import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";

import "../../../../data/repository/topics_repository.dart";
import "../../../../data/services/firestore_service.dart";
import "../state/main_cubit.dart";
import "../topic/topic_item.dart";
import "admin_state.dart";

class AdminCubit extends Cubit<AdminState> {

  AdminCubit() : super(AdminState(topics: [])) {
    initialize();
  }
  final getIt = GetIt.instance;
  late final TopicsRepository _firestoreService = getIt<TopicsRepository>();

  void selectTopic(final TopicItem topic) {
    emit(state.copyWith(selectedTopic: topic));
  }

  Future<void> updateTopic(final TopicItem updatedTopic) async {
    try {
      var item = await _firestoreService.updateItem(updatedTopic);

      var updatedTopics = await _firestoreService.getItems();
      emit(state.copyWith(topics: updatedTopics));
    } catch (e) {
      print(e);
      // Handle any exceptions
    }
  }

  Future<void> deleteSelectedTopic() async {
    try {
      var selected = state.selectedTopic;

      if(selected == null) {
        return;
      }
      await _firestoreService.deleteItem(selected.id!);
      var updatedTopics = await _firestoreService.getItems();
      var newSelected = updatedTopics.firstOrNull;
      emit(state.copyWith(topics: updatedTopics, selectedTopic: newSelected));
    } catch (e) {
      // Handle any exceptions
    }
  }

  Future<void> createEmptyTopic() async {
    try {
      var newTopic = await _firestoreService.createNewEmptyItem();
      // Assuming you have a method to fetch all topics
      var updatedTopics = await _firestoreService.getItems();
      emit(state.copyWith(
        topics: updatedTopics,
        selectedTopic: newTopic,
      ),);
    } catch (e) {
      print(e);
      // Handle any exceptions
    }
  }

  Future<void> initialize() async {
    try {
      // Assuming FirestoreService.getItems() returns List<TopicItem>
      var items = await _firestoreService.getItems();
      var selectedItem = items.firstOrNull;

      emit(state.copyWith(topics: items, selectedTopic: selectedItem));
    } catch (e) {
      print(e);
    }
  }
}
