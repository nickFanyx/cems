import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AViewMovRecBloc {

  Color getColor(String movStatus) {
    Color checkin = Colors.green; //checkout
    Color checkout = Colors.red; //checkin

     if (movStatus == "Check-In") {
      return checkin;
    } else {
      return checkout;
    }
  }

  AssetImage getImage(String movStatus) {
    AssetImage checkin = const AssetImage('assets/images/checkin.png');
    AssetImage checkout = const AssetImage('assets/images/checkout.png');

    if (movStatus == "Check-In") {
      return checkin;
    } else {
      return checkout;
    }
  }

//update example
  Future verifyRes(
    String recordId,
    String verifyResult,
    String response,
  ) async {
    CollectionReference record =
        FirebaseFirestore.instance.collection('MovementRecord');

    await record
        .doc(recordId)
        .update({
          'verifyResult': verifyResult,
          'staffResponse': response,
        })
        .then((value) => print("Record Updated"))
        .catchError((error) => print("Failed to update record: $error"));
  }
}
