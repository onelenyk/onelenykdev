import "package:cloud_firestore/cloud_firestore.dart";
import "package:get_it/get_it.dart";
import "package:onelenykco/app/data/services/firestore_service.dart";

import "package:cloud_firestore/cloud_firestore.dart";

import "../user/user_payload.dart";

class UserPayloadRepository {
  final getIt = GetIt.instance;

  late final FirestoreService service = getIt.get<FirestoreService>();

  late final CollectionReference<UserPayload> _usersCollection =
      service.getUsersList();

  // Create
  Future<UserPayload?> createUser(final String uid) async {
    try {
      final newUser = UserPayload(
        id: "",
        uid: uid,
        taps: [],
      );

      final newDocRef = await _usersCollection.add(newUser);
      final newUserSnapshot = await newDocRef.get();
      final data = newUserSnapshot.data()!;
      await _usersCollection.doc(newDocRef.id).update({'id': newDocRef.id});
      return data;
    } catch (e) {
      print("Error creating user: $e");
      return null;
    }
  }

  // Read
  Future<UserPayload?> getUserByUID(final String uid) async {
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
      print("Error finding user by UID: $e");
      return null;
    }
  }

  Future<UserPayload?> findOrCreateUserPayloadByUID(final String uid) async {
    final existingUser = await getUserByUID(uid);
    return existingUser ?? await createUser(uid);
  }

  // Update
  Future<UserPayload?> updateUser(final UserPayload user) async {
    try {
      await _usersCollection.doc(user.id).set(user);
      return user;
      print("User updated successfully");
    } catch (e) {
      return null;
      print("Error updating user: $e");
    }
  }

  // Delete
  Future<void> deleteUser(final String id) async {
    try {
      await _usersCollection.doc(id).delete();
      print("User deleted successfully");
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  // Handle Tap List
  Future<UserPayload?> addTap(final String userId, final Tap tap) async {
    try {
      final userDoc = await _usersCollection.doc(userId).get();
      if (userDoc.exists) {
        final user = userDoc.data()!;
        final toUpdateUser = user.copyWith(taps: [...user.taps, tap]);
        await updateUser(toUpdateUser);
        return user;
      }
      return null;
    } catch (e) {
      print("Error adding tap: $e");
      return null;
    }
  }

  Future<UserPayload?> removeTap(
      final String userId, final String tapId) async {
    try {
      final userDoc = await _usersCollection.doc(userId).get();
      if (userDoc.exists) {
        final user = UserPayload.fromSnapshot(userDoc);
        user.taps.removeWhere((final tap) => tap.id == tapId);
        await updateUser(user);
        return user;
      }
    } catch (e) {
      return null;
      print("Error removing tap: $e");
    }
  }
}
