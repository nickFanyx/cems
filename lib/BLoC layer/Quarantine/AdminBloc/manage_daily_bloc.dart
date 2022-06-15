import 'package:cems/Data%20layer/Quarantine/daily_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageDailybloc {
  //create query for retrieve daily status data
  getData() {
    return FirebaseFirestore.instance
        .collection("DailyStatus")
        .orderBy("dateTime", descending: true)
        .snapshots();
  }

  //create daily record object
  DailyRec createModel(data) {
    List<bool> sympl = [];

    //create list
    for (var symp in data['symptomsList']) {
      sympl.add(symp);
    }
    //return object
    return DailyRec(
      data['dailyId'],
      data['userId'],
      sympl,
      data['emergencyCall'],
      data['userName'],
      (data['dateTime'] as Timestamp).toDate(),
    );
  }
}
