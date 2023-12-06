import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  Future<void> init() async {
    emit(const SplashLoading(message: 'Buscando actualizaciones...'));
    await Future.delayed(const Duration(milliseconds: 750));
    emit(const SplashLoading(message: 'Conectando con el servidor...'));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(const SplashLoading(message: 'Descargando información...'));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(const SplashLoading(message: 'Iniciando...'));
    await Future.delayed(const Duration(milliseconds: 500));

    emit(const SplashLoaded());
  }
}
