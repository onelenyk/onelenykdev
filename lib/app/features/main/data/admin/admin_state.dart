import "package:onelenykco/app/features/main/data/topic/topic_item.dart";

class AdminState {

  AdminState({required this.topics, this.selectedTopic});
  final List<TopicItem> topics;
  final TopicItem? selectedTopic;

  List<TopicItem> get sortedTopics => List.from(topics)..sort((final a, final b) {
      // Handling null dates
      if (a.date == null || b.date == null) {
        return 0;
      } else {
        return a.date!.compareTo(b.date!);
      }
    });

  AdminState copyWith({
    final List<TopicItem>? topics,
    final TopicItem? selectedTopic,
  }) => AdminState(
      topics: topics ?? this.topics,
      selectedTopic: selectedTopic ?? this.selectedTopic,
    );
}