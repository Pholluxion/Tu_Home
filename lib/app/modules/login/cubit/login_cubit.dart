import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tu_home/app/core/core.dart';

import '../data/data.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final _tokenRepository = TokenRepository(
    TokenService.create(getIt.get<EnvManger>().baseUrl),
  );

  final _userRepository = UserRepository(
    UserService.create(getIt<EnvManger>().baseUrl),
  );

  void login(String email, String password) async {
    emit(LoginLoading());
    try {
      final token = await _tokenRepository.auth(email, password);
      final userResponse = await _userRepository.getUserByEmail(
        email,
        "Bearer ${token.accessToken}",
      );

      emit(LoginSuccess(
        token: "Bearer ${token.accessToken}",
        userResponse: userResponse,
      ));
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
