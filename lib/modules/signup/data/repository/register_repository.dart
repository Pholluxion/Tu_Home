import 'package:tu_home/modules/signup/data/services/register_service.dart';

class RegisterRepository {
  final RegisterService _registerService;

  RegisterRepository(this._registerService);

  Future<bool> register(
    String name,
    String surname,
    String email,
    String password,
    String documentNumber,
    // DocType docType,
  ) async {
    try {
      final response = await _registerService.register({
        'name': name,
        'surname': surname,
        'email': email,
        'password': password,
        'documentNumber': documentNumber,
        // 'docType': docType,
      });
      return response.isSuccessful;
    } catch (e) {
      rethrow;
    }
  }
}
