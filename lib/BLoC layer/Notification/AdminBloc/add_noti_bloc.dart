import 'package:cems/Data%20layer/Notification/notification_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNotiBloc {
  Future addNoti(
    String user_id,
    String notification_id,
    String notification_title,
    String notification_description,
    String notification_details,
  ) async {
    final docRec =
        FirebaseFirestore.instance.collection("NotificationRecord").doc();
    final NotificationModel noti = NotificationModel(
      "1",
      docRec.id,
      notification_title,
      notification_description,
      notification_details,
    );

    final json = noti.toJson();
    await docRec.set(json);
  }
}
