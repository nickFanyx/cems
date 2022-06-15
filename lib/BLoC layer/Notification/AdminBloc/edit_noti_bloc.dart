import 'package:cems/Data%20layer/Notification/notification_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditNotiBloc {
  Future updateRec(
    String noti_id,
    String notification_title,
    String notification_description,
    String notification_details,
  ) async {
    CollectionReference rec =
        FirebaseFirestore.instance.collection("NotificationRecord");
//update query
    await rec
        .doc(noti_id)
        .update({
          'notification_title': notification_title,
          'notification_description': notification_description,
          'notification_details': notification_details,
        })
        .then((value) => print("Record Updated"))
        .catchError((error) => print("Failed to update record: $error"));
  }
}
