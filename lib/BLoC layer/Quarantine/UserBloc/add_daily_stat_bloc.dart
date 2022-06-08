import 'package:cems/Data%20layer/Quarantine/daily_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDailyBloc {
  Future addDaily(String userId, List<bool> symptomsList, bool emergencyCall,
      String userName) async {
    final docRec = FirebaseFirestore.instance.collection("DailyStatus").doc();
    final DailyRec stat = DailyRec(
      docRec.id,
      userId,
      symptomsList,
      emergencyCall,
      userName,
      DateTime.now(),
    );
    final json = stat.toJson();
    await docRec.set(json);
  }
}
