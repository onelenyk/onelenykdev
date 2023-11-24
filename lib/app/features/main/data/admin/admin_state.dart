import '../topic/topic_item.dart';

class AdminState {
  final List<TopicItem> topics;
  final TopicItem? selectedTopic;

  AdminState({required this.topics, this.selectedTopic});

  List<TopicItem> get sortedTopics {
    return List.from(topics)..sort((a, b) {
      // Handling null dates
      if (a.date == null || b.date == null) {
        return 0;
      } else {
        return a.date!.compareTo(b.date!);
      }
    });
  }

  AdminState copyWith({
    List<TopicItem>? topics,
    TopicItem? selectedTopic,
  }) {
    return AdminState(
      topics: topics ?? this.topics,
      selectedTopic: selectedTopic ?? this.selectedTopic,
    );
  }
}