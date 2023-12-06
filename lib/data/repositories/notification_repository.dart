import 'package:tu_home/data/models/models.dart';
import 'package:tu_home/data/services/services.dart';

class NotificationRepository {
  final NotificationService _notificationService;

  NotificationRepository(this._notificationService);

  Future<List<Notification>> getNotifications(String token) async {
    final response = await _notificationService.getNotifications(token);
    if (response.statusCode == 200) {
      return notificationsFromResponse(response.body);
    } else {
      throw Exception('Error al cargar las notificaciones');
    }
  }
}
