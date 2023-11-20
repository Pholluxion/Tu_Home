import 'package:tu_home/modules/home/data/data.dart';

class ContractRepository {
  final ContractsService _contractsService;

  ContractRepository(this._contractsService);

  Future<List<Contract>> getContractUserId(int id, String token) async {
    final response = await _contractsService.getContractUserId(token, id);
    if (response.statusCode == 200) {
      final contractsResponse = ContractsResponse.fromJson(response.body);
      return contractsResponse.contracts;
    } else {
      throw Exception('Error al cargar los contratos');
    }
  }

  Future<List<Contract>> getContractByPropertyId(int id, String token) async {
    final response = await _contractsService.getContractByPropertyId(token, id);
    if (response.statusCode == 200) {
      final contractsResponse = ContractsResponse.fromJson(response.body);
      return contractsResponse.contracts;
    } else {
      throw Exception('Error al cargar los contratos');
    }
  }
}
