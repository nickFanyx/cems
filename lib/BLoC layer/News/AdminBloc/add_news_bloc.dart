import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cems/Data layer/News/news_record.dart';

class AddNewsBloc {
  Future addNews(
    String user_id,
    String news_id,
    String news_title,
    String news_description,
    String news_details,
  ) async {
    final docRec = FirebaseFirestore.instance.collection("newsRecord").doc();
    final NewsModel noti = NewsModel(
      "1",
      docRec.id,
      news_title,
      news_description,
      news_details,
    );

    final json = noti.toJson();
    await docRec.set(json);
  }
}
