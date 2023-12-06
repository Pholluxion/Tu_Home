class Notification {
  final int id;
  final String description;
  final String title;
  final int userId;

  Notification({
    required this.id,
    required this.description,
    required this.title,
    required this.userId,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'title': title,
      'userId': userId,
    };
  }
}

List<Notification> notificationsFromResponse(List<dynamic> json) =>
    json.map((notification) => Notification.fromJson(notification)).toList();
