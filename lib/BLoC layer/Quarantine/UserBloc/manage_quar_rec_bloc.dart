import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageQRRecordBloc {
  getData() {
    String userId = "0148393272";

    return FirebaseFirestore.instance
        .collection("QuarantineRecord")
        .where("userId", isEqualTo: userId)
        .snapshots();
  }

  QuarantineModel creatingModel(var data) {
    QuarantineModel model = QuarantineModel(
      recordid: data['recordid'],
      userId: data['userId'],
      usertype: data['usertype'],
      symptomsDetail: data['symptomsDetail'],
      patientName: data['patientName'],
      patientNo: data['patientNo'],
      quarantinePlace: data['quarantinePlace'],
      quarantineAddress: data['quarantineAddress'],
      testResult: data['testResult'],
      verifyResult: data['verifyResult'],
      username: data['username'],
      staffResponse: data['staffResponse'],
      dateTime: (data['dateTime'] as Timestamp).toDate(),
    );

    return model;
  }
}
