import 'package:cems/Data%20layer/Quarantine/daily_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageDailybloc {
  getData() {
    return FirebaseFirestore.instance
        .collection("DailyStatus")
        .orderBy("dateTime", descending: true)
        .snapshots();
  }

  DailyRec createModel(data) {
    List<bool> sympl = [];
    for (var symp in data['symptomsList']) {
      sympl.add(symp);
    }
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
