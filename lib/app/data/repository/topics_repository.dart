import "package:cloud_firestore/cloud_firestore.dart";
import "package:get_it/get_it.dart";
import "package:http/http.dart";
import 'package:onelenykco/app/data/services/firestore_service.dart';
import 'package:onelenykco/app/features/main/data/topic/topic_content.dart';
import 'package:onelenykco/app/features/main/data/topic/topic_item.dart';


class TopicsRepository {

  TopicsRepository();
  final getIt = GetIt.instance;

  late final FirestoreService service =  getIt.get<FirestoreService>();

  late final CollectionReference<TopicItem> _topicsCollection = service.getTopicsList();

  Future<TopicItem?> createNewEmptyItem() async {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    final newTopic = TopicItem(
      id: null, // Firestore will auto-generate this
      date: DateTime.now(), // Placeholder or default value for date
      content: TopicContent(title: "", data: [
        TopicDataItem(date: currentTime, text: ""),
      ],), // Default value for content
    );

    // Add a new document with an auto-generated ID
    var data = await _topicsCollection.add(newTopic);
    var tempItem = await getItem(data.id);
    await updateItem(tempItem!);
    return tempItem;
  }
  // Create a new item
  Future<void> createItem(final TopicItem item) async {
    try {
      await _topicsCollection.doc(item.id).set(item);
    } catch (e) {
      // Handle the error here
      print("Error creating item: $e");
      // Optionally, you can rethrow the error or handle it differently
    }
  }
  Future<TopicItem?> getItem(final String id) async {
    try {
      var snapshot = await _topicsCollection.doc(id).get();

      if (snapshot.exists) {
        // Convert the document data to a TopicItem object
        return snapshot.data()?.copyWith(id: snapshot.id);
      }
    } catch (e) {
      // Handle the error here
      print("Error getting items: $e");
      return null; // Returning an empty list or handle differently
    }
    return null;
  }
  Future<List<TopicItem>> getItems() async {
    try {
      var snapshot = await _topicsCollection.get();
      return snapshot.docs
          .map((final doc) => doc.data().copyWith(id: doc.id))
          .toList();
    } catch (e) {
      // Handle the error here
      print("Error getting items: $e");
      return []; // Returning an empty list or handle differently
    }
  }
  Stream<List<TopicItem>> getItemsLive() => _topicsCollection.snapshots().map((final snapshot) =>
        snapshot.docs.map((final doc) => doc.data().copyWith(id: doc.id)).toList(),);
  Future<void> updateItem(final TopicItem item) async {
    try {
      var result = _topicsCollection.doc(item.id);
      result
          .set(item)
          .then((final _) => print("Success"))
          .catchError((final error) => print("Failed: $error"));
    } catch (e) {
      // Handle the error here
      print("Error updating item: $e ${item.toJson()}");
    }
  }
  Future<void> deleteItem(final String itemId) async {
    try {
      await _topicsCollection.doc(itemId).delete();
    } catch (e) {
      // Handle the error here
      print("Error deleting item: $e");
    }
  }
// Other methods for adding, updating, deleting topics...
}
