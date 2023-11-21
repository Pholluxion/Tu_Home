import 'package:chopper/chopper.dart';

part 'property_service.chopper.dart';

@ChopperApi(baseUrl: '/api/properties')
abstract class PropertyService extends ChopperService {
  static PropertyService create(String baseUrl) {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      services: [_$PropertyService()],
      converter: const JsonConverter(),
    );
    return _$PropertyService(client);
  }

  @Get(path: '/{id}')
  Future<Response> getProperty(
    @Header('Authorization') String token,
    @Path('id') int id,
  );
}
