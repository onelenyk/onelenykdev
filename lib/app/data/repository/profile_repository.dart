import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:onelenykco/app/data/services/firestore_service.dart';
import 'package:onelenykco/app/features/main/data/profile/profile_item.dart';

import '../../features/main/data/profile/employment_item.dart';

class ProfileRepository {
  final getIt = GetIt.instance;

  late final FirestoreService service = getIt.get<FirestoreService>();

  late final CollectionReference<ProfileItem> _profileCollection =
      service.getProfileList();
  late final CollectionReference<Map<String, dynamic>> _profileCollectionRaw =
      service.getProfile();

  ProfileRepository();

  Future<ProfileItem?> getItem(String id) async {
    try {
      var snapshot = await _profileCollectionRaw.doc(id).get();

      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;
        print('data ${data}');

        // Fetch experiences
        var experienceRefs =
            List<DocumentReference>.from(data['experience'] ?? []);
        var experiences = await _fetchExperiences(experienceRefs, id);

        data.update("experience", (value) => experiences);
        // Construct the ProfileItem with the fetched experiences
        return ProfileItem.fromJson(data).copyWith(
          id: snapshot.id,
      //    skills: experiences, // Replace with the fetched experiences
        );
      }
    } catch (e) {
      print('Error getting item: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> _fetchExperiences(List<DocumentReference> experienceRefs, String docId) async {
    var experiences = <Map<String, dynamic>>[];

    for (var ref in experienceRefs) {
      var snapshot = await _profileCollectionRaw
          .doc(docId)
          .collection("experience")
          .doc(ref.id)
          .get();
      var expData = snapshot.data();
      if (expData != null) {
        experiences
            .add(expData);
      }
    }

    return experiences;
  }

/*  Future<void> createItem(ProfileItem item) async {
    try {
      await _profileCollection.doc(item.id).set(item);
    } catch (e) {
      // Handle the error here
      print('Error creating item: $e');
      // Optionally, you can rethrow the error or handle it differently
    }
  }

  Future<ProfileItem?> getItem(String id) async {
    try {
      var snapshot = await _profileCollection.doc(id).get();

      if (snapshot.exists) {
        print('data ${snapshot.toString()}');

        // Convert the document data to a TopicItem object
        return snapshot.data()?.copyWith(id: snapshot.id);
      }
    } catch (e) {
      // Handle the error here
      print('Error getting items: $e');
      return null; // Returning an empty list or handle differently
    }
    return null;
  }

  Future<List<ProfileItem>> getItems() async {
    try {
      var snapshot = await _profileCollection.get();
      return snapshot.docs
          .map((doc) => doc.data().copyWith(id: doc.id))
          .toList();
    } catch (e) {
      // Handle the error here
      print('Error getting items: $e');
      return []; // Returning an empty list or handle differently
    }
  }

  Stream<List<ProfileItem>> getItemsLive() {
    return _profileCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data().copyWith(id: doc.id)).toList());
  }

  Future<void> updateItem(ProfileItem item) async {
    try {
      var result = _profileCollection.doc(item.id);
      result
          .set(item)
          .then((_) => print('Success'))
          .catchError((error) => print('Failed: $error'));
    } catch (e) {
      // Handle the error here
      print('Error updating item: $e ${item.toJson()}');
    }
  }

  Future<void> deleteItem(String itemId) async {
    try {
      await _profileCollection.doc(itemId).delete();
    } catch (e) {
      // Handle the error here
      print('Error deleting item: $e');
    }
  }
// Other methods for adding, updating, deleting topics...*/
}
