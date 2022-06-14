import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cems/Data layer/News/news_record.dart';

class ANewsDashboardBloc {
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
