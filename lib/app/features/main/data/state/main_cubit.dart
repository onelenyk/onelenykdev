import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onelenykco/app/features/main/data/state/main_state.dart';
import 'package:onelenykco/main.dart';

import '../../../../data/repository/topics_repository.dart';
import '../../../../data/services/firestore_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../topic/topic_content.dart';
import '../topic/topic_item.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(
            topics: [],
            selectedTopic: null,
            profileTopic: null,
            projectsTopic: null,
            resumeTopic: null,
            hireMeTopic: null)) {
    initialize();
  }

  final getIt = GetIt.instance;
  late final _topicsRepository = getIt<TopicsRepository>();

  void selectTopic({required TopicItem topic}) {
    emit(state.copyWith(selectedTopic: topic));
  }

  Future<void> initialize() async {
    try {
      var items = await _topicsRepository.getItems();
      var selectedItem = profile;
      emit(state.copyWith(
          topics: items,
          selectedTopic: selectedItem,
          profileTopic: profile,
          projectsTopic: projects,
          resumeTopic: resumeItem,
          hireMeTopic: hireMeItem));
    } catch (e) {
      print(e);
    }
  }

  Future<void> refresh() async {
    try {
      var items = await _topicsRepository.getItems();

      emit(state.copyWith(
        topics: items,
      ));
    } catch (e) {
      print(e);
    }
  }
}

final TopicItem adminItem = TopicItem(
    id: "admin",
    date: DateTime.timestamp(),
    content: TopicContent(title: "admin", data: []));

final TopicItem profile = TopicItem(
    id: "profile",
    date: DateTime.timestamp(),
    content: TopicContent(title: "Nazar Lenyk", data: []));

final TopicItem projects = TopicItem(
    id: "projects",
    date: DateTime.timestamp(),
    content: TopicContent(title: "📔 Projects & Ideas", data: []));

final TopicItem resumeItem = TopicItem(
    id: "resume",
    date: DateTime.timestamp(),
    content: TopicContent(title: "resume 📓", data: []));

final TopicItem hireMeItem = TopicItem(
    id: "hire me",
    date: DateTime.timestamp(),
    content: TopicContent(title: "hire me 👀", data: []));
