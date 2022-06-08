import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageQRRecordBloc {
  getData() {
    String userId = "0148393272";

    return FirebaseFirestore.instance
        .collection("QuarantineRecord")
        .where("userId", isEqualTo: userId)
        .orderBy("dateTime", descending: true)
        .snapshots();
  }

  QuarantineModel creatingModel(var data) {
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
