import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onelenykco/app/features/main/data/profile/profile_item.dart';
import 'package:onelenykco/app/features/main/data/topic/topic_content.dart';

import '../../features/main/data/topic/topic_item.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> getTopics() {
    return _firestore.collection("topics");
  }

  CollectionReference<TopicItem> getTopicsList() {
    return _firestore.collection("topics").withConverter<TopicItem>(
          fromFirestore: (snapshot, _) => TopicItem.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  CollectionReference<Map<String, dynamic>> getProfile() {
    return _firestore.collection("profile");
  }

  CollectionReference<ProfileItem> getProfileList() {
    return _firestore.collection("profile").withConverter<ProfileItem>(
          fromFirestore: (snapshot, _) =>
              ProfileItem.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
    ;
  }
}
