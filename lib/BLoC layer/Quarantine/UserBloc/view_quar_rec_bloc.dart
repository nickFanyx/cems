import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewQRRecord {
  //calculate day between created and current day
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round() + 1;
  }

  //produce color for ui
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

  //delete quarantine record
  Future<void> deleteRec(String recordId) async {
    //query delete
    CollectionReference rec =
        FirebaseFirestore.instance.collection('QuarantineRecord');

    //delete
    return rec
        .doc(recordId)
        .delete()
        .then((value) => print("record deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
