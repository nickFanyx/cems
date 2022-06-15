import 'package:cems/Data%20layer/Movement/move_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UCheckInRecBloc {
  getData() {
    return FirebaseFirestore.instance
        .collection("MovementRecord")
        .orderBy("dateTime", descending: true)
        .snapshots();
  }

  MovementModel creatingModel(var data) {
    MovementModel model = MovementModel(
      data['userId'],
      data['locationName'],
      data['movStatus'],
      data['name'],
      data['riskLevel'],
      data['vacStatus'],
      (data['dateTime'] as Timestamp).toDate(),
    );

    return model;
  }
}
