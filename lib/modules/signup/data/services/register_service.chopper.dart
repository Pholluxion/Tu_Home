// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$RegisterService extends RegisterService {
  _$RegisterService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RegisterService;

  @override
  Future<Response<dynamic>> register(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
