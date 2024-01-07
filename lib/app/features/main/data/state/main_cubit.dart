
import "package:bloc/bloc.dart";
import "package:get_it/get_it.dart";
import "package:onelenykco/app/features/main/data/state/main_state.dart";
import "package:onelenykco/app/features/main/data/state/routes.dart";

class MainCubit extends Cubit<MainState> {MainCubit()
      : super(MainState(activeRoute: Routes.Resume, isMenuOpened: true));

  final getIt = GetIt.instance;

  void selectTopic({required final Routes route}) {
    emit(state.copyWith(activeRoute: route));
  }

  Future<void> openMenu() async {
    emit(state.copyWith(isMenuOpened: !state.isMenuOpened));
  }
}