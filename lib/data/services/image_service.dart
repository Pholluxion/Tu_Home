import 'package:chopper/chopper.dart';

part 'image_service.chopper.dart';

@ChopperApi(baseUrl: '/api/networkImages')
abstract class ImageService extends ChopperService {
  static ImageService create(String url) {
    final newClient = ChopperClient(
      baseUrl: Uri.parse(url),
      services: [_$ImageService()],
      converter: const JsonConverter(),
    );
    return _$ImageService(newClient);
  }

  @Get()
  Future<Response> getImages(
    @Header('Authorization') String token,
  );

  @Get(path: '/property/{id}')
  Future<Response> getImagesByPropertyId(
    @Header('Authorization') String token,
    @Path('id') int id,
  );
}
