import 'package:bloc/bloc.dart';

enum NavState {
  home(0),
  dashboard(1),
  notification(2);

  final int value;

  const NavState(this.value);
}

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavState.home);

  void changeNavState(NavState navState) {
    emit(navState);
  }
}
