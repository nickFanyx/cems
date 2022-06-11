import 'package:cloud_firestore/cloud_firestore.dart';

class ViewDashboardNewsBloc {
  Future<void> deleteNoti(String news_id) async {
    CollectionReference rec =
        FirebaseFirestore.instance.collection('newsRecord');
    return rec
        .doc(news_id)
        .delete()
        .then((value) => print(news_id))
        .then((value) => print("News Deleted"))
        .catchError((error) => print("Failed to delete notification: $error"));
  }
}
