import '../data.dart';

class TokenRepository {
  final TokenService _tokenService;

  TokenRepository(this._tokenService);

  Future<Token> auth(String email, String password) async {
    final response = await _tokenService.auth({
      'email': email,
      'password': password,
    });

    if (response.isSuccessful) {
      return Token.fromJson(response.body);
    } else {
      throw Exception(response.error);
    }
  }
}
