import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tu_home/app/data/modules/env.dart';
import 'package:tu_home/app/data/services/service_locator.dart';
import 'package:tu_home/modules/property/data/data.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  PropertyCubit() : super(PropertyInitial());

  final _propertyRepository = PropertyRepository(
    PropertyService.create(getIt.get<EnvManger>().baseUrl),
  );

  Future<void> getProperty(int id, String token) async {
    emit(PropertyLoading());
    try {
      final property = await _propertyRepository.getProperty(id, token);
      emit(PropertyLoaded(property));
    } catch (e) {
      emit(PropertyError(e.toString()));
    }
  }
}