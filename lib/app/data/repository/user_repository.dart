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

  Future<UserPayload?> findOrCreateUserPayloadByUID(String uid) async {
    try {
      final existingUser = await findUserByUID(uid);
      if (existingUser != null) {
        return existingUser;
      } else {
        final newUser = UserPayload(
          id: '', // Firestore will auto-generate this
          uid: uid,
          lastClickDate: Timestamp.now(),
        );

        final newDocRef = await _usersCollection.add(newUser);
        final newUserSnapshot = await newDocRef.get();
        return UserPayload.fromSnapshot(newUserSnapshot);
      }
    } catch (e) {
      print("Error finding or creating user by login: $e");
      return null;
    }
  }

  Future<void> updateLastClickDate(String id, Timestamp lastClickDate) async {
    try {
      await _usersCollection
          .doc(id)
          .update(
          {"lastClickDate": lastClickDate}
      );
    } catch (e) {
      print("Error updating last click date: $e");
    }
  }
}
