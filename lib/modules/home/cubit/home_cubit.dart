import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tu_home/app/data/services/service_locator.dart';

import '../../../app/data/modules/shared_preferences.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  FutureOr<void> yourCustomFunction() async {
    await getIt<SharedPreferencesService>().setString('key', 'value');
    yourCustomFunction2();
  }

  FutureOr<void> yourCustomFunction2() async {
    final data = await getIt<SharedPreferencesService>().getString('key');

    emit(state.copyWith(customProperty: data));
  }
}
