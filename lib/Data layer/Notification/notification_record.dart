class NotificationModel {
  //create model for notification
  final String user_id;
  final String notification_id;
  final String notification_title;
  final String notification_description;
  final String notification_details;

  NotificationModel(
    this.user_id,
    this.notification_id,
    this.notification_title,
    this.notification_description,
    this.notification_details,
  );

//insert db
  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'notification_id': notification_id,
        'notification_title': notification_title,
        'notification_description': notification_description,
        'notification_details': notification_details,
      };
}
