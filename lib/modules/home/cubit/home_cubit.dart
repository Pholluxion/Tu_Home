import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tu_home/data/data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  final _contractRepository = ContractRepository(
    ContractsService.create(getIt.get<EnvManger>().baseUrl),
  );

  final _propertyRepository = PropertyRepository(
    PropertyService.create(getIt.get<EnvManger>().baseUrl),
  );

  final _imageRepository = ImageRepository(
    ImageService.create(getIt.get<EnvManger>().baseUrl),
  );

  final _notificationRepository = NotificationRepository(
    NotificationService.create(getIt.get<EnvManger>().baseUrl),
  );

  Future<Property> getProperty(String token, int id) async {
    try {
      final property = await _propertyRepository.getProperty(id, token);
      return property;
    } catch (e) {
      emit(HomeError(message: e.toString()));
      rethrow;
    }
  }

  Future<void> getContractUserId(int id, String token) async {
    emit(const HomeLoading());
    try {
      final images = await _imageRepository.getImages(
        token,
      );
      final notifications = await _notificationRepository.getNotifications(
        token,
      );
      final contracts = await _contractRepository.getContractUserId(
        id,
        token,
      );

      final ourNotifications = notifications.where((element) {
        return element.userId == id;
      }).toList();

      final properties = await Future.wait(
        contracts.map((e) => getProperty(token, e.propertyId)),
      );

      emit(
        HomeLoaded(
          contracts: contracts,
          images: images,
          properties: properties,
          notifications: ourNotifications,
        ),
      );
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
