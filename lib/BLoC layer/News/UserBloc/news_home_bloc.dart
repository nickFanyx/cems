import 'package:cems/Data%20layer/News/news_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UNewsHomeBloc {
  getData() {
    return FirebaseFirestore.instance
        .collection("newsRecord")
        .where("user_id", isEqualTo: "1")
        .snapshots();
  }

  NewsModel creatingModel(var data) {
    NewsModel model = NewsModel(data['user_id'], data['news_id'],
        data['news_title'], data['news_description'], data['news_details']);
    return model;
  }
}
