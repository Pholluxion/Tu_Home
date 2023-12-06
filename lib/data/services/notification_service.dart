import 'package:chopper/chopper.dart';

part 'notification_service.chopper.dart';

@ChopperApi(baseUrl: '/api/notifications')
abstract class NotificationService extends ChopperService {
  static NotificationService create(String baseUrl) {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      services: [_$NotificationService()],
      converter: const JsonConverter(),
    );
    return _$NotificationService(client);
  }

  @Get()
  Future<Response> getNotifications(@Header('Authorization') String token);
}
