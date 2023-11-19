import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tu_home/app/data/modules/env.dart';
import 'package:tu_home/app/data/services/service_locator.dart';
import 'package:tu_home/modules/login/data/data.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final _tokenRepository = TokenRepository(
    TokenService.create(getIt.get<EnvManger>().baseUrl),
  );

  void login(String email, String password) async {
    emit(LoginLoading());
    try {
      final token = await _tokenRepository.auth(email, password);
      emit(LoginSuccess(token.accessToken));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  void logout() async {
    emit(LoginLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(LogOutSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
