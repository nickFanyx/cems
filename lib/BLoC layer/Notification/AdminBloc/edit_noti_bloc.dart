import 'package:cems/Data%20layer/Notification/notification.record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditNotiBloc {
  Future editNoti(
      String user_id,
      String notification_id,
      String notification_title,
      String notification_description,
      String notification_details) async {
    final docRec =
        FirebaseFirestore.instance.collection("NotificationRecord").doc();
    final NotificationModel noti = NotificationModel(
      user_id,
      notification_id,
      notification_title,
      notification_description,
      notification_details,
    );

    final json = noti.toJson();
    await docRec.set(json);
  }
}
