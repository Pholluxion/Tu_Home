// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$UserService extends UserService {
  _$UserService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserService;

  @override
  Future<Response<dynamic>> getUserByEmail(
    String token,
    String email,
  ) {
    final Uri $url = Uri.parse('/api/users/findByEmail/${email}');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateUser(
    String token,
    int id,
    Map<String, dynamic> body,
  ) {
    final Uri $url = Uri.parse('/api/users/${id}');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
