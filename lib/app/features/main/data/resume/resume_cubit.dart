import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
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

  Future<void> initialize() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/resume.json');
      final item = ProfileItem.fromJson(jsonDecode(jsonString));
      emit(state.copyWith(profile: item));
    } catch (e) {
      print(e);
    }
  }
}
