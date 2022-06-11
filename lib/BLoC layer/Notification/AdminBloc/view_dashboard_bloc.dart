import 'package:cloud_firestore/cloud_firestore.dart';

class ViewDashboardBloc {
  Future<void> deleteNoti(String noti_id) async {
    CollectionReference rec =
        FirebaseFirestore.instance.collection('NotificationRecord');
    return rec
        .doc(noti_id)
        .delete()
        .then((value) => print(noti_id))
        .then((value) => print("Notification Deleted"))
        .catchError((error) => print("Failed to delete notification: $error"));
  }
}
