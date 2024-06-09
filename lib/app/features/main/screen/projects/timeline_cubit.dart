import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:onelenykco/app/data/firebase/auth/auth_state.dart";
import "package:onelenykco/app/data/firebase/auth_cubit.dart";
import 'package:onelenykco/app/data/repository/user_payload_repository.dart';
import "package:onelenykco/app/data/user/user_payload.dart";
import "package:onelenykco/app/features/main/screen/munera/personal_state.dart";
import "package:onelenykco/app/features/main/screen/munera/scenario/scenario_state.dart";
import "package:onelenykco/app/features/main/screen/projects/timeline_state.dart";

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit() : super(TimelineState(reversed: true)) {}

  Future<void> tapButton() async {
    emit(state.copyWith(reversed: !state.reversed));
  }
}
