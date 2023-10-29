import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'adaptive_state.dart';

class AdaptiveCubit extends Cubit<AdaptiveState> {
  AdaptiveCubit() : super(const AdaptiveState());

  void setIndex(int newIndex) {
    emit(state.copyWith(selectedNavigation: newIndex));
  }
}
