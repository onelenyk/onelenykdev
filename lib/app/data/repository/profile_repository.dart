import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:onelenykco/app/data/services/firestore_service.dart';
import 'package:onelenykco/app/features/main/data/profile/profile_item.dart';

import '../../features/main/data/profile/employment_item.dart';

/*
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

        ExperienceItem.fromJson(experiences[0])
        experiences.map((e) => e.toString());
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

}
*/
