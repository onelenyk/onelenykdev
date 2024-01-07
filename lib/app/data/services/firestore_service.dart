import "package:cloud_firestore/cloud_firestore.dart";
import "package:onelenykco/app/features/main/data/profile/profile_item.dart";

import "package:onelenykco/app/features/main/data/topic/topic_item.dart";

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> getTopics() => _firestore.collection("topics");

  CollectionReference<TopicItem> getTopicsList() => _firestore.collection("topics").withConverter<TopicItem>(
          fromFirestore: (final snapshot, final _) => TopicItem.fromJson(snapshot.data()!),
          toFirestore: (final model, final _) => model.toJson(),
        );

  CollectionReference<Map<String, dynamic>> getProfile() => _firestore.collection("profile");

  CollectionReference<ProfileItem> getProfileList() => _firestore.collection("profile").withConverter<ProfileItem>(
          fromFirestore: (final snapshot, final _) =>
              ProfileItem.fromJson(snapshot.data()!),
          toFirestore: (final model, final _) => model.toJson(),
        );
}
