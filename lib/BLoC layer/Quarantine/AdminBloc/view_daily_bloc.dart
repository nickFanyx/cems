import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewDailyBloc {
  //explicit intent make call
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //delete daily status from database
  Future<void> deleteStat(String statId) async {
    //collection reference
    CollectionReference rec =
        FirebaseFirestore.instance.collection('DailyStatus');

    //delete status
    return rec
        .doc(statId)
        .delete()
        .then((value) => print("record deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
