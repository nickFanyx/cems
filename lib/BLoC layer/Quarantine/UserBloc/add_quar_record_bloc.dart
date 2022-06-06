import 'dart:developer';
import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddQuarRecordBloc {
  Future addRecord(String hello) async {
    log('hello : $hello');
    final docRec =
        FirebaseFirestore.instance.collection("QuarantineRecord").doc();
    final QuarantineModel quar = QuarantineModel(
      recordid: docRec.id,
      userId: "",
      usertype: "",
      symptomsDetail: "",
      patientName: "nik",
      patientNo: "",
      quarantinePlace: 1,
      quarantineAddress: "Lot 1681-b",
      testResult: "Negative",
      verifyResult: "",
      username: "nick",
    );
    final json = quar.toJson();
    await docRec.set(json);
  }
}
