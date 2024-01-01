import 'package:freezed_annotation/freezed_annotation.dart';

import '../topic/topic_item.dart';


part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  factory MainState({
    required List<TopicItem> topics,
    required TopicItem? selectedTopic,
    required TopicItem? profileTopic,
    required TopicItem? projectsTopic,
    required TopicItem? resumeTopic,
    required TopicItem? hireMeTopic,
    required bool isMenuOpened
  }) = _MainState;

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

  MainState._(); // Private constructor for freezed
}
