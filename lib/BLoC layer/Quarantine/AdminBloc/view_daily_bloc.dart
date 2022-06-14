import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewDailyBloc {
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> deleteStat(String statId) async {
    CollectionReference rec =
        FirebaseFirestore.instance.collection('DailyStatus');
    return rec
        .doc(statId)
        .delete()
        .then((value) => print("record deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
