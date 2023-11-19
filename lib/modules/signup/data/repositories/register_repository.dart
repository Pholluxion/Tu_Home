import 'dart:developer';

import 'package:tu_home/modules/signup/data/data.dart';

class RegisterRepository {
  final RegisterService _registerService;

  RegisterRepository(this._registerService);

  Future<bool> register(
    String name,
    String surname,
    String email,
    String password,
    String documentNumber,
    DocType docType,
  ) async {
    try {
      final response = await _registerService.register({
        'name': name,
        'surname': surname,
        'email': email,
        'password': password,
        'documentNumber': documentNumber,
        'documentType': docType.id,
      });
      return response.isSuccessful;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
