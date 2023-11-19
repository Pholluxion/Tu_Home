import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tu_home/app/data/modules/env.dart';
import 'package:tu_home/app/data/services/service_locator.dart';
import 'package:tu_home/modules/signup/data/data.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final _registerRepository = RegisterRepository(
    RegisterService.create(getIt.get<EnvManger>().baseUrl),
  );

  void signup(
    String name,
    String surname,
    String email,
    String password,
    String documentNumber,
    // DocType docType,
  ) async {
    emit(SignupLoading());
    try {
      await _registerRepository.register(
        name,
        surname,
        email,
        password,
        documentNumber,
        // docType,
      );
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
