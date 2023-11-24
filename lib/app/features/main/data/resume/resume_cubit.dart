import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onelenykco/app/data/repository/profile_repository.dart';
import 'package:onelenykco/app/features/main/data/profile/profile_item.dart';
import 'package:onelenykco/app/features/main/data/resume/resume_state.dart';
import 'package:onelenykco/app/features/main/data/state/main_state.dart';
import 'package:onelenykco/main.dart';

import '../../../../data/repository/topics_repository.dart';
import '../../../../data/services/firestore_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../topic/topic_content.dart';
import '../topic/topic_item.dart';

class ResumeCubit extends Cubit<ResumeState> {
  ResumeCubit()
      : super(ResumeState(
            profile: ProfileItem(
                id: '',
                title: '',
                role: '',
                location: '',
                firstName: '',
                lastName: '',
                age: '',
                description: '',
                languages: [],
                experience: [],
                skills: []))) {
    initialize();
  }

  final getIt = GetIt.instance;
  late final _profileRepository = getIt<ProfileRepository>();

  Future<void> initialize() async {
    try {
      var item = await _profileRepository.getItem("d9TwID6xyEDXh5fvBQ1G");

      if (item == null) {
        return;
      } else {
        emit(state.copyWith(profile: item));
      }
    } catch (e) {
      print(e);
    }
  }
}
