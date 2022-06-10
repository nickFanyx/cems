import 'package:cems/Data%20layer/Notification/notification.record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UHomeBloc {
  getData() {
    return FirebaseFirestore.instance
        .collection("NotificationRecord")
        .where("user_id", isEqualTo: "1")
        .snapshots();
  }

  NotificationModel creatingModel(var data) {
    NotificationModel model = NotificationModel(
        data['notification_id'],
        data['user_id'],
        data['notification_title'],
        data['notification_description'],
        data['notification_details']);

    return model;
  }
}
