import 'dart:developer';
import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddQuarRecordBloc {
  Future addRecord(
      String userId,
      String userType,
      String symDetail,
      String patientName,
      String patientNo,
      String quarantinePlace,
      String quarAddress,
      String testRes,
      String userName) async {
    //log('hello : $hello');

    final docRec =
        FirebaseFirestore.instance.collection("QuarantineRecord").doc();
    final QuarantineModel quar = QuarantineModel(
      recordid: docRec.id,
      userId: "0148393272",
      usertype: userType,
      symptomsDetail: symDetail,
      patientName: patientName,
      patientNo: patientNo,
      quarantinePlace: quarantinePlace,
      quarantineAddress: quarAddress,
      testResult: testRes,
      verifyResult: "Not Verify",
      username: userName,
      staffResponse: "",
      dateTime: DateTime.now(),
    );
    log('lol :${quar.symptomsDetail}${quar.usertype}${quar.quarantinePlace}${quar.quarantineAddress}${quar.testResult}');
    final json = quar.toJson();
    await docRec.set(json);
  }
}
