import 'package:chopper/chopper.dart';

part 'user_service.chopper.dart';

@ChopperApi(baseUrl: '/api/users')
abstract class UserService extends ChopperService {
  static UserService create(String url) {
    final newClient = ChopperClient(
      baseUrl: Uri.parse(url),
      services: [_$UserService()],
      converter: const JsonConverter(),
    );
    return _$UserService(newClient);
  }

  @Get(path: 'findByEmail/{email}')
  Future<Response> getUserByEmail(
    @Header('Authorization') String token,
    @Path('email') String email,
  );

  @Put(path: '/{id}')
  Future<Response> updateUser(
    @Header('Authorization') String token,
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );
}
