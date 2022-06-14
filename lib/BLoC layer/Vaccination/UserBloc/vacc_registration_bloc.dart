import 'package:cems/Data%20layer/Vaccination/vacc_register_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VaccRegisterBloc {
  Future vaccRegister(String userId, bool vaccInterest, bool vaccDisease,
      bool vaccOku, String username) async {
    final docRec =
        FirebaseFirestore.instance.collection("VaccineRegistration").doc();

    final VaccRegisterRec stat = VaccRegisterRec(
      docRec.id,
      userId,
      vaccInterest,
      vaccDisease,
      vaccOku,
      DateTime.now(),
    );
    final json = stat.toJson();
    await docRec.set(json);
  }
}
