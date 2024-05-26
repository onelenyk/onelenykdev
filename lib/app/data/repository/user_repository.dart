import "package:cloud_firestore/cloud_firestore.dart";
import "package:get_it/get_it.dart";
import "package:onelenykco/app/data/services/firestore_service.dart";

import "package:cloud_firestore/cloud_firestore.dart";

import "../user/user_payload.dart";

class UserRepository {
  final getIt = GetIt.instance;

  late final FirestoreService service = getIt.get<FirestoreService>();

  late final CollectionReference<UserPayload> _usersCollection =
      service.getUsersList();

  Future<UserPayload?> findUserByUID(String uid) async {
    try {
      final querySnapshot =
          await _usersCollection.where("uid", isEqualTo: uid).limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        final userDoc = querySnapshot.docs.first;
        return userDoc.data();
      } else {
        return null;
      }
    } catch (e) {
      print("Error finding user by login: $e");
      return null;
    }
  }


  Future<void> updateItem(final UserPayload item) async {
    try {
      final result = _usersCollection.doc(item.id);
      result
          .set(item)
          .then((final _) => print("Success"))
          .catchError((final error) => print("Failed: $error"));
    } catch (e) {
      print("Error updating item: $e ${item.toJson()}");
    }
  }

  Future<void> updateLastClickDate(String id, Timestamp lastClickDate) async {
    try {
      await _usersCollection
          .doc(id)
          .update({"lastClickDate": lastClickDate});
    } catch (e) {
      print("Error updating last click date: $e");
    }
  }
}
