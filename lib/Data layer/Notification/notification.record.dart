class NotificationModel {
  final String notification_id;
  final String user_id;
  final String notification_title;
  final String notification_description;

  NotificationModel(
    this.notification_id,
    this.user_id,
    this.notification_title,
    this.notification_description,
  );

  Map<String, dynamic> toJson() => {
        'notification_id': notification_id,
        'user_id': user_id,
        'notification_title': notification_title,
        'notification_description': notification_description,
      };
}
