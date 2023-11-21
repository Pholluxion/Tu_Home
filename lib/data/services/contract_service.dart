import 'package:chopper/chopper.dart';

part 'contract_service.chopper.dart';

@ChopperApi(baseUrl: '/api/contracts')
abstract class ContractsService extends ChopperService {
  static ContractsService create(String url) {
    final newClient = ChopperClient(
      baseUrl: Uri.parse(url),
      services: [_$ContractsService()],
      converter: const JsonConverter(),
    );
    return _$ContractsService(newClient);
  }

  @Get(path: '/user/{id}')
  Future<Response> getContractUserId(
    @Header('Authorization') String token,
    @Path('id') int id,
  );

  @Get(path: '/property/{id}')
  Future<Response> getContractByPropertyId(
    @Header('Authorization') String token,
    @Path('id') int id,
  );
}
