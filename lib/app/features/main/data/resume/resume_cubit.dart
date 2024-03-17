import "dart:convert";

import "package:bloc/bloc.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/services.dart";
import "package:get_it/get_it.dart";
import "package:onelenykco/app/features/main/data/profile/education_item.dart";
import "package:onelenykco/app/features/main/data/profile/profile_item.dart";
import "package:onelenykco/app/features/main/data/resume/resume_state.dart";

class ResumeCubit extends Cubit<ResumeState> {
  ResumeCubit()
      : super(
          ResumeState(
              profile: ProfileItem(
                id: "",
                title: "",
                role: "",
                location: "",
                firstName: "",
                lastName: "",
                age: "",
                description: "",
                education: EducationItem(
                    universityName: "",
                    role: "",
                    startDate: Timestamp.now(),
                    endDate: null),
                languages: [],
                experience: [],
                skills: [],
              ),
              isScreenshotMode: false,
              doScreenShot: false),
        ) {
    initialize();
  }

  final getIt = GetIt.instance;

  void screenShotConsumed() async {
    emit(state.copyWith(doScreenShot: false));
  }

  void dispatchScreenShot() async {
    emit(state.copyWith(doScreenShot: true));
  }

  Future<void> initialize() async {
    try {
      final jsonString = await rootBundle.loadString("assets/resume.json");
      final item = ProfileItem.fromJson(jsonDecode(jsonString));
      emit(state.copyWith(profile: item));
    } catch (e) {
      print(e);
    }
  }
}
