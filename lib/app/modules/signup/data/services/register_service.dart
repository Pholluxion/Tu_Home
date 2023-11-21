import 'package:chopper/chopper.dart';

part 'register_service.chopper.dart';

@ChopperApi(baseUrl: '/register')
abstract class RegisterService extends ChopperService {
  static RegisterService create(String baseUrl) {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      services: [_$RegisterService()],
      converter: const JsonConverter(),
    );
    return _$RegisterService(client);
  }

  /// POST /register
  @Post()
  Future<Response> register(@Body() Map<String, dynamic> body);
}
