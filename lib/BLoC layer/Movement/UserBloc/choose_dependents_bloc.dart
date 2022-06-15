import 'dart:developer';
import 'package:cems/Data%20layer/Movement/move_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMovRecordBloc {
  Future addMovRecord(
      String userId,
      String locationName,
      String movStatus,
      String name,
      String riskLevel,
      String vacStatus) async {

    final docRec =
        FirebaseFirestore.instance.collection("MovementRecord").doc();
    final MovementModel quar = MovementModel(
      userId,
      locationName,
      movStatus,
      name,
      riskLevel,
      vacStatus,
      DateTime.now(),
    );
    final json = quar.toJson();
    await docRec.set(json);
  }
}
