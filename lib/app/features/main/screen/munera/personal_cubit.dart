import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:onelenykdev/app/data/firebase/auth/auth_state.dart";
import "package:onelenykdev/app/data/firebase/auth_cubit.dart";
import 'package:onelenykdev/app/data/repository/user_payload_repository.dart';
import "package:onelenykdev/app/data/user/user_payload.dart";
import "package:onelenykdev/app/features/main/screen/munera/personal_state.dart";
import "package:onelenykdev/app/features/main/screen/munera/scenario/scenario_state.dart";

class PersonalCubit extends Cubit<PersonalState> {
  final getIt = GetIt.instance;
  late final UserPayloadRepository userRepository =
      getIt<UserPayloadRepository>();
  late final AuthenticationCubit authorizationCubit =
      getIt<AuthenticationCubit>();

  PersonalCubit()
      : super(PersonalState(
            activeScenario: ScenarioState(user: null, payload: null),
            isLoading: false)) {
    // initialize();
    // Listen to changes in AuthorizationCubit and react accordingly
    authorizationCubit.stream.listen((authorizationState) async {
      if (authorizationState is AuthLoading) {
      } else if (authorizationState is AuthInitial) {
        emit(state.copyWith(
            activeScenario: ScenarioState(user: null, payload: null),
            isLoading: false));
      } else if (authorizationState is AuthFailed) {
        emit(state.copyWith(
            activeScenario: ScenarioState(user: null, payload: null),
            isLoading: false));
      } else if (authorizationState is AuthSuccess) {
        final user = authorizationState.user!;
        final userPayload = await userRepository.getUserByUID(user.uid);

        if (userPayload == null) {
          emit(state.copyWith(
              activeScenario: ScenarioState(user: null, payload: null),
              isLoading: false));
        } else {
          emit(
            state.copyWith(
                activeScenario: ScenarioState(
                  user: user,
                  payload: userPayload,
                ),
                isLoading: false),
          );
        }
      } else {}
    });
  }

  Future<void> tapButton() async {
    emit(state.copyWith(isLoading: true));
    final main = state.activeScenario;
    final tap = Tap(id: "", tapDate: Timestamp.now());
    final payload = await userRepository.addTap(main.payload!.id!, tap);
    emit(state.copyWith(
        activeScenario: main.copyWith(payload: payload), isLoading: false));
  }
}
