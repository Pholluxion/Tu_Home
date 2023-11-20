// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$ContractsService extends ContractsService {
  _$ContractsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ContractsService;

  @override
  Future<Response<dynamic>> getContractUserId(
    String token,
    int id,
  ) {
    final Uri $url = Uri.parse('/api/contracts/user/${id}');
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
  Future<Response<dynamic>> getContractByPropertyId(
    String token,
    int id,
  ) {
    final Uri $url = Uri.parse('/api/contracts/property/${id}');
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
}
