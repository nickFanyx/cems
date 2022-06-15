import 'dart:developer';
import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddQuarRecordBloc {
  //add quarantine record into database
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

    //query insert
    final docRec =
        FirebaseFirestore.instance.collection("QuarantineRecord").doc();

    //create object
    final QuarantineModel quar = QuarantineModel(
      docRec.id,
      "0148393272",
      userType,
      symDetail,
      patientName,
      patientNo,
      quarantinePlace,
      quarAddress,
      testRes,
      "Not Verify",
      userName,
      "",
      DateTime.now(),
    );

    //insert
    final json = quar.toJson();
    await docRec.set(json);
  }
}
