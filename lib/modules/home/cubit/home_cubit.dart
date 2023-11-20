import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tu_home/app/data/modules/env.dart';
import 'package:tu_home/app/data/services/service_locator.dart';
import 'package:tu_home/modules/home/data/data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  final _contractRepository = ContractRepository(
    ContractsService.create(getIt.get<EnvManger>().baseUrl),
  );

  final _imageRepository = ImageRepository(
    ImageService.create(getIt.get<EnvManger>().baseUrl),
  );

  Future<void> getContractUserId(int id, String token) async {
    emit(const HomeLoading());
    try {
      final images = await _imageRepository.getImages(token);
      final contracts = await _contractRepository.getContractUserId(
        id,
        token,
      );
      emit(HomeLoaded(contracts: contracts, images: images));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> getContractByPropertyId(int id, String token) async {
    emit(const HomeLoading());
    try {
      final contracts = await _contractRepository.getContractByPropertyId(
        id,
        token,
      );
      emit(HomeLoaded(contracts: contracts));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
