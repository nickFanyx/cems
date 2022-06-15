import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:cems/Interface%20layer/Quarantine/AdminView/view_quar_rec_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AManageQRBloc {
  //create query for retrieve quarantine data
  getQuery() async {
    //read query
    return FirebaseFirestore.instance
        .collection("QuarantineRecord")
        .orderBy("dateTime", descending: true)
        .get();
  }

  //create quarantine object model
  QuarantineModel creatingModel(var data) {
    //create object
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
