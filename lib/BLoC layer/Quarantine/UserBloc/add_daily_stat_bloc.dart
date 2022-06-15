import 'package:cems/Data%20layer/Quarantine/daily_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDailyBloc {
  //add daily status into database
  Future addDaily(String userId, List<bool> symptomsList, bool emergencyCall,
      String userName) async {
    //query
    final docRec = FirebaseFirestore.instance.collection("DailyStatus").doc();

    //create object
    final DailyRec stat = DailyRec(
      docRec.id,
      userId,
      symptomsList,
      emergencyCall,
      userName,
      DateTime.now(),
    );

    //insert
    final json = stat.toJson();
    await docRec.set(json);
  }
}
