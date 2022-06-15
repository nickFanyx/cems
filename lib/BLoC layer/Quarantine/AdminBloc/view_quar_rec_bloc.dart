import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdViewQRRecbloc {
  //calculate days from created to today
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round() + 1;
  }

  //produce color for the ui
  Color getColor(String status) {
    Color warning = Colors.red;
    Color lowrisk = Colors.green;
    Color noresponse = Colors.grey;

    if (status == "Not Verify") {
      return noresponse;
    } else if (status == "Confirmed Case") {
      return warning;
    } else {
      return lowrisk;
    }
  }

  //update verification into database
  Future verifyRes(
    String recordId,
    String verifyResult,
    String response,
  ) async {
    //collection reference
    CollectionReference record =
        FirebaseFirestore.instance.collection('QuarantineRecord');

    //update query
    await record
        .doc(recordId)
        .update({
          'verifyResult': verifyResult,
          'staffResponse': response,
        })
        .then((value) => print("Record Updated"))
        .catchError((error) => print("Failed to update record: $error"));
  }

  //delete quarantine record from database
  Future<void> deleteRec(String recordId) async {
    //reference for quarantine record
    CollectionReference rec =
        FirebaseFirestore.instance.collection('QuarantineRecord');

    //delete record
    return rec
        .doc(recordId)
        .delete()
        .then((value) => print("record deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
