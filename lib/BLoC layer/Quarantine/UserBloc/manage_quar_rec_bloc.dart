import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageQRRecordBloc {
  //query read quarantine record
  getData() {
    String userId = "0148393272";
    //query
    return FirebaseFirestore.instance
        .collection("QuarantineRecord")
        .where("userId", isEqualTo: userId)
        .orderBy("dateTime", descending: true)
        .snapshots();
  }

  //create object
  QuarantineModel creatingModel(var data) {
    //create
    QuarantineModel model = QuarantineModel(
      data['recordid'],
      data['userId'],
      data['usertype'],
      data['symptomsDetail'],
      data['patientName'],
      data['patientNo'],
      data['quarantinePlace'],
      data['quarantineAddress'],
      data['testResult'],
      data['verifyResult'],
      data['username'],
      data['staffResponse'],
      (data['dateTime'] as Timestamp).toDate(),
    );

    return model;
  }
}
