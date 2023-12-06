import '../data.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  Future<UserResponse> getUserByEmail(
    String email,
    String token,
  ) async {
    final response = await _userService.getUserByEmail(token, email);
    return UserResponse.fromJson(response.body);
  }

  Future<bool> updateUser(
    int id,
    String token,
    Map<String, dynamic> body,
  ) async {
    final response = await _userService.updateUser(token, id, body);
    return response.isSuccessful;
  }
}
