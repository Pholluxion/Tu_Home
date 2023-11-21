import 'package:chopper/chopper.dart';

part 'token_service.chopper.dart';

@ChopperApi(baseUrl: '/authenticate')
abstract class TokenService extends ChopperService {
  static TokenService create(String url) {
    final newClient = ChopperClient(
      baseUrl: Uri.parse(url),
      services: [_$TokenService()],
      converter: const JsonConverter(),
    );
    return _$TokenService(newClient);
  }

  /// POST /authenticate
  @Post()
  Future<Response<dynamic>> auth(@Body() Map<String, dynamic> body);
}
