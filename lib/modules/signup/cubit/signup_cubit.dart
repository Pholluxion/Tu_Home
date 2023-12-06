import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tu_home/data/data.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final _registerRepository = RegisterRepository(
    RegisterService.create(getIt.get<EnvManger>().baseUrl),
  );

  void signup({
    required String name,
    required String surname,
    required String email,
    required String password,
    required String documentNumber,
    required DocType docType,
  }) async {
    emit(SignupLoading());
    try {
      await _registerRepository.register(
        name,
        surname,
        email,
        password,
        documentNumber,
        docType,
      );
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
