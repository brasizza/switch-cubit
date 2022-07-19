import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeController extends Cubit<SwitchStatus> {
  HomeController() : super(SwitchStatus.inactive);

  void changeSwitch(bool change) {
    if (change) {
      emit(SwitchStatus.active);
    } else {
      emit(SwitchStatus.inactive);
    }
  }
}
