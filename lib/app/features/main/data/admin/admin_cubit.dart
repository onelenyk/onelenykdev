import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:onelenykco/app/data/repository/topics_repository.dart";
import "package:onelenykco/app/features/main/data/admin/admin_state.dart";
import "package:onelenykco/app/features/main/data/topic/topic_item.dart";

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
      final item = await _firestoreService.updateItem(updatedTopic);

      final updatedTopics = await _firestoreService.getItems();
      emit(state.copyWith(topics: updatedTopics));
    } catch (e) {
      print(e);
      // Handle any exceptions
    }
  }

  Future<void> deleteSelectedTopic() async {
    try {
      final selected = state.selectedTopic;

      if(selected == null) {
        return;
      }
      await _firestoreService.deleteItem(selected.id!);
      final updatedTopics = await _firestoreService.getItems();
      final newSelected = updatedTopics.firstOrNull;
      emit(state.copyWith(topics: updatedTopics, selectedTopic: newSelected));
    } catch (e) {
      // Handle any exceptions
    }
  }

  Future<void> createEmptyTopic() async {
    try {
      final newTopic = await _firestoreService.createNewEmptyItem();
      // Assuming you have a method to fetch all topics
      final updatedTopics = await _firestoreService.getItems();
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
      final items = await _firestoreService.getItems();
      final selectedItem = items.firstOrNull;

      emit(state.copyWith(topics: items, selectedTopic: selectedItem));
    } catch (e) {
      print(e);
    }
  }
}
